//
//  ListViewModel+APIHandling.swift
//  StarWars2
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation


extension ListViewModel {
    
    func callListAPI(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        guard let service = self.starWarsItem.serviceName else {
            self.errorUpdate()
            completion?(Result.failure(ErrorResult.parser(string: StarWarsConstants.Texts.errorMessage)))
            return
        }
        
        service.fetchConverter { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    self?.data = converter.results
                    self?.callNestedListAPI(completion)
                case .failure(let error) :
                    self?.errorUpdate(error: ErrorResult.network(string: StarWarsConstants.Texts.noInternet))
                    completion?(Result.failure(error))
                }
            }
        }
    }
}

extension ListViewModel {
    
    private func callNestedListAPI(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        let queue = OperationQueue()
        
        for (ith, planet) in self.data.enumerated() {
            print("\n\nNESTED API START\(ith)===\(planet.name)===\(planet.residents.count)\n")
            queue.addOperation(addPeopleOperation(obj: planet, atIndex: ith))
            queue.addOperation(addFilmsOperation(obj: planet, atIndex: ith))
        }
        queue.waitUntilAllOperationsAreFinished()
        planetsGroup.notify(queue: .main) { [unowned self] in
            print("\n\n\nPLANET GROUP SHOULD BE DONE\n\n\n")
            CoreDataHelper.saveObjectsInEntity(objects: self.data) { _ in
                self.planetFromCoreData = CoreDataHelper.getAllPlanets()
                completion?(Result.success(true))
            }
        }
    }
}


extension ListViewModel {
    
    private func addPeopleOperation(obj: PlanetModel, atIndex: Int) -> BlockOperation {
        let peopleOperation = BlockOperation {
            self.callNestedPeopleAPI(planet: obj, atIndex: atIndex)
        }
        return peopleOperation
    }
    
    private func addFilmsOperation(obj: PlanetModel, atIndex: Int) -> BlockOperation {
        let filmOperation = BlockOperation {
            self.callNestedFilmsAPI(planet: obj, atIndex: atIndex)
        }
        return filmOperation
    }
    
}

extension ListViewModel {
    
    private func callNestedPeopleAPI(planet: PlanetModel, atIndex: Int)  {
        for (jth, residentUrl) in planet.residents.enumerated() {
            print("\n\nPeople===\(jth)===\(planet.name)\n\n")
            self.planetsGroup.enter()
            if !planet.residents.isEmpty, let url = URL(string: residentUrl) {
                let peopleService: RouterProtocol? = APIRouter(url: url)
                peopleService?.fetchPeople({ [weak self] result in
                    switch result {
                    case .success(let people):
                        self?.inititializeResidentsIfNeeded(index: atIndex, resident: people)
                        
                    case .failure(_):
                        self?.errorUpdate(error: ErrorResult.network(string: StarWarsConstants.Texts.noInternet))
                    }
                    self?.planetsGroup.leave()
                })
            }
        }
    }
    
    private func callNestedFilmsAPI(planet: PlanetModel, atIndex: Int)  {
        for (jth, filmsUrl) in planet.films.enumerated() {
            print("\n\nFilm===\(jth)===\(planet.name)\n\n")
            self.planetsGroup.enter()
            if !planet.films.isEmpty, let url = URL(string: filmsUrl) {
                let peopleService: RouterProtocol? = APIRouter(url: url)
                peopleService?.fetchFilm({ [weak self] result in
                    switch result {
                    case .success(let film):
                        self?.inititializeFilmsIfNeeded(index: atIndex, film: film)
                    case .failure(_):
                        self?.errorUpdate(error: ErrorResult.network(string: StarWarsConstants.Texts.noInternet))
                    }
                    self?.planetsGroup.leave()
                })
            }
        }
    }
    
}

private extension ListViewModel {
    private func errorUpdate(error: ErrorResult? = nil) {
        onErrorHandling?(error ?? ErrorResult.custom(string: StarWarsConstants.Texts.errorMessage))
    }
}

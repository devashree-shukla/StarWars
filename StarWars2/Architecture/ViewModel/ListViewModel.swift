//
//  ListViewModel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation
import CoreData

protocol ListViewModelProtocol {
    func fetchData(_ completion: ((Result<Bool, ErrorResult>) -> Void)?)
    func selectItem(index: Int, _ completion: ((Planets?) -> Void)?)
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set }
    var starWarsItem: StarWars { get set }
    var navigationTitle: String? { get }
    var planetFromCoreData: [Planets] { get }
    var selectedItem: Planets? { get }
}

class ListViewModel: ListViewModelProtocol {

    // MARK: - Input
    private var service: RouterProtocol?
    var starWarsItem: StarWars = .planets
    private var data: [PlanetModel] = []

    // MARK: - Output
    var onErrorHandling: ((ErrorResult?) -> Void)?
    var selectedItem: Planets?
    var navigationTitle: String? {
        (starWarsItem.description) + "(\(data.count) records)"
    }
    var planetFromCoreData: [Planets] = []

    func fetchData(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        if let count = CoreDataHelper.numberOfPlanets(), count > 0 {
            self.planetFromCoreData = CoreDataHelper.getAllPlanets()
            completion?(Result.success(true))
        } else {
        service = starWarsItem.serviceName
        guard let service = self.service else {
            onErrorHandling?(ErrorResult.custom(string: StarWarsConstants.Texts.errorMessage))
            completion?(Result.failure(ErrorResult.parser(string: StarWarsConstants.Texts.errorMessage)))
            return
        }

        service.fetchConverter { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    self?.data = converter.results
                    self?.asyncCalls(completion)
                case .failure(let error) :
                    self?.onErrorHandling?(ErrorResult.parser(string: StarWarsConstants.Texts.errorMessage))
                    completion?(Result.failure(error))
                }
            }
        }
        }
    }

    func selectItem(index: Int, _ completion: ((Planets?) -> Void)?) {
        selectedItem = CoreDataHelper.getSelectedItem(name: self.data[index].name)
        completion?(selectedItem)
    }

    func asyncCalls(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        let queue = OperationQueue()
        let planetsGroup = DispatchGroup()
            for (ith, planet) in self.data.enumerated() {
                print("\(ith)===\(planet.name)===\(planet.residents.count)")
                let peopleOperation = BlockOperation {
                    for (jth, residentUrl) in planet.residents.enumerated() {
                        planetsGroup.enter()
                        if !planet.residents.isEmpty, let url = URL(string: residentUrl) {
                            let peopleService: RouterProtocol? = APIRouter(url: url)
                            peopleService?.fetchPeople({ [weak self] result in
                                print("\(jth)===\(planet.name)")
                                    switch result {
                                    case .success(let people):
                                        self?.inititializeResidentsIfNeeded(index: ith, resident: people)

                                    case .failure(_): break
                                    }
                                planetsGroup.leave()
                            })
                        }
                    }
                }
                queue.addOperation(peopleOperation)

                let filmOperation = BlockOperation {
                    for (jth, filmsUrl) in planet.films.enumerated() {
                        planetsGroup.enter()
                        if !planet.films.isEmpty, let url = URL(string: filmsUrl) {
                            let peopleService: RouterProtocol? = APIRouter(url: url)
                            peopleService?.fetchFilm({ [weak self] result in
                                print("\(jth)===\(planet.name)")
                                    switch result {
                                    case .success(let film):
                                        self?.inititializeFilmsIfNeeded(index: ith, film: film)

                                    case .failure(_): break
                                    }
                                planetsGroup.leave()
                            })
                        }
                    }
                }
                queue.addOperation(filmOperation)

            }
        planetsGroup.notify(queue: .main) { [unowned self] in
             print("PLANET GROUP SHOULD BE DONE")
            CoreDataHelper.saveObjectsInEntity(objects: self.data) { _ in
                self.planetFromCoreData = CoreDataHelper.getAllPlanets()
                 completion?(Result.success(true))
             }
         }

    }

}

 private extension ListViewModel {

    private func inititializeResidentsIfNeeded(index: Int, resident: PeopleModel) {
        if self.data[index].residentArray == nil {
            self.data[index].residentArray = []
        }
        self.data[index].residentArray?.append(resident)
    }

    private func inititializeFilmsIfNeeded(index: Int, film: FilmModel) {
        if self.data[index].filmArray == nil {
            self.data[index].filmArray = []
        }
        self.data[index].filmArray?.append(film)
    }

 }

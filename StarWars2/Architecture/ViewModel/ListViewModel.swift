//
//  ListViewModel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation


protocol ListViewModelProtocol {
    func fetchData(_ completion: ((Result<Bool, ErrorResult>) -> Void)?)
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set }
    var starWarsItem: StarWars { get set }
//    var data: [PlanetModel] { get }
    var navigationTitle: String? { get }
    
    var planetArray: [PlanetListModel] { get set }
    var peopleArray: [PeopleListModel] { get set }
    var filmArray: [FilmsListModel] { get set }
}


class ListViewModel: ListViewModelProtocol {
    
    // MARK: - Input
    private var service: RouterProtocol?
    var starWarsItem: StarWars = .planets
    
    //MARK: - Output
//    var data: [PlanetModel] = []
    var onErrorHandling: ((ErrorResult?) -> Void)?
    var navigationTitle: String? {
        (starWarsItem.description) + "(\(planetArray.count) records)"
    }
    var planetArray: [PlanetListModel] = []
    var peopleArray: [PeopleListModel] = []
    var filmArray: [FilmsListModel] = []
    
    func fetchData(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
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
                    if let results = converter.results {
                        results.forEach {
                            switch self?.starWarsItem {
                            case .planets:
                                let object = PlanetListModel(planets: $0, residents: nil, films: nil)
                                self?.planetArray.append(object)
                            case .people: break
                                //                                    let object = PeopleListModel(people: $0, films: nil)
                                //                                    self?.peopleArray.append(object)
                            case .films: break
                                //                                    let object = FilmsListModel(films: $0, planets: nil, characters: nil)
                                //                                    self?.filmtArray.append(object)
                            case .starships, .spices, .vehicles: break
                            case .none: break
                            }
                        }
                        
                        completion?(Result.success(true))
                        self?.getData()
                    } else {
                        self?.onErrorHandling?(ErrorResult.parser(string: StarWarsConstants.Texts.errorMessage))
                        completion?(Result.failure(ErrorResult.parser(string: StarWarsConstants.Texts.errorMessage)))
                    }
                case .failure(let error) :
                    self?.onErrorHandling?(ErrorResult.parser(string: StarWarsConstants.Texts.errorMessage))
                    completion?(Result.failure(error))
                }
            }
        }
    }
    
    
    private func getData() {
        let queue = OperationQueue()
        
        //        switch starWarsItem {
        //        case .planets:
        //
        //        case .people:
        //
        //        case .films:
        //
        //        case .starships:
        //
        //        case .spices:
        //
        //        case .vehicles:
        //
        //        }
        
        let updateA = BlockOperation {
            let group = DispatchGroup()
            group.enter()
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0, execute: {
                
                for (index, element) in self.planetArray.enumerated() {
                    for (_, element2) in element.planets.residents.enumerated() {
                        if let url = URL(string: element2) {
                            let planetService: RouterProtocol? = PlanetRouter(url: url)
                            planetService?.fetchPeople { [weak self] result in
                                
                                DispatchQueue.main.async {
                                    switch result {
                                    case .success(let converter) :
                                        if self?.planetArray[index].residents == nil {
                                            self?.planetArray[index].residents = []
                                        }
                                        if let obj = converter.first {
                                            self?.planetArray[index].residents?.append(obj)
                                        }
                                    case .failure(let error) :
                                        print(error)
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                group.leave()
            })
            group.wait()
            print("updateB done")
            
        }
        queue.addOperation(updateA)
        
        let updateB = BlockOperation {
            let group = DispatchGroup()
            group.enter()
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0, execute: {
                
                for (index, element) in self.planetArray.enumerated() {
                    for (_, element2) in element.planets.films.enumerated() {
                        if let url = URL(string: element2) {
                            let planetService: RouterProtocol? = PlanetRouter(url: url)
                            planetService?.fetchFilms { [weak self] result in
                                DispatchQueue.main.async {
                                    switch result {
                                    case .success(let converter) :
                                        if self?.planetArray[index].films == nil {
                                            self?.planetArray[index].films = []
                                        }
                                        if let obj = converter.first {
                                            self?.planetArray[index].films?.append(obj)
                                        }
                                    case .failure(let error) :
                                        print(error)
                                    }
                                }
                            }
                        }
                    }
                }
                group.leave()
            })
            group.wait()
            print("updateB done")
        }
        queue.addOperation(updateB)
        let doSomethingWithAandB = BlockOperation {
            print("doSomethingWithAandB")
        }
        doSomethingWithAandB.addDependency(updateA)
        doSomethingWithAandB.addDependency(updateB)
        queue.addOperation(doSomethingWithAandB)
        queue.waitUntilAllOperationsAreFinished()
    }
    
}

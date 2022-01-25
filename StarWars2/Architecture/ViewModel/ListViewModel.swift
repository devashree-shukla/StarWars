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
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set }
    var starWarsItem: StarWars { get set }
    var navigationTitle: String? { get }
    var data: [PlanetModel] { get }
    func saveInCoreData()
}


class ListViewModel: ListViewModelProtocol {
    
    // MARK: - Input
    private var service: RouterProtocol?
    var starWarsItem: StarWars = .planets
    var data: [PlanetModel] = []
    private let currentContext = CoreDataConnection.sharedInstance.persistentContainer.viewContext
    
    //MARK: - Output
    var onErrorHandling: ((ErrorResult?) -> Void)?
    var navigationTitle: String? {
        (starWarsItem.description) + "(\(data.count) records)"
    }
    
    
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
                    self?.data = converter.results
                    self?.saveInCoreData()
                    completion?(Result.success(true))
//                    self?.getData()
                case .failure(let error) :
                    self?.onErrorHandling?(ErrorResult.parser(string: StarWarsConstants.Texts.errorMessage))
                    completion?(Result.failure(error))
                }
            }
        }
    }
    
    
    func saveInCoreData() {
        _ = data.map { CoreDataHelper.createPlanetEntityFrom($0, context: currentContext) }
        do {
            try currentContext.save()
        } catch let error {
            print(error)
        }
    }
    
}


 private extension ListViewModel {
    
    private func inititializeResidentsIfNeeded(index: Int, resident: PeopleModel) {
        if self.data[index].residentArray == nil {
            self.data[index].residentArray = []
        }
        self.data[index].residentArray?.append(resident)
        
        CoreDataHelper.saveFilmsEntityIn(self.data[index].name, [resident], context: currentContext)
    }
    
    
    private func inititializeFilmsIfNeeded(index: Int, film: FilmModel) {
        if self.data[index].filmArray == nil {
            self.data[index].filmArray = []
        }
        self.data[index].filmArray?.append(film)
    }
    
     
     private func getData(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
         let queue = OperationQueue()

         let updateA = BlockOperation {
             let group = DispatchGroup()
             group.enter()
             DispatchQueue.global().asyncAfter(deadline: .now() + 2.0, execute: {

                 for (i, element) in self.data.enumerated() {
                     for (_, element2) in element.residents.enumerated() {
                         if let url = URL(string: element2) {
                             let peopleService: RouterProtocol? = APIRouter(url: url)
                             
                             peopleService?.fetchPeople({ [weak self] result in
                                 DispatchQueue.main.async {
                                     switch result {
                                     case .success(let people):
                                         self?.inititializeResidentsIfNeeded(index: i, resident: people)
                                         group.leave()
                                     case .failure(let error):
                                         completion?(Result.failure(error))
                                         group.leave()
                                     }
                                 }
                             })
                         }
                     }
                 }
             })
             group.wait()
             print("updateB done")

         }
         queue.addOperation(updateA)

//         let updateB = BlockOperation {
//             let group = DispatchGroup()
//             group.enter()
//             DispatchQueue.global().asyncAfter(deadline: .now() + 2.0, execute: {
//
//                 for (j, element) in self.data.enumerated() {
//                     for (_, element2) in element.films.enumerated() {
//                         if let url = URL(string: element2) {
//                             let filmService: RouterProtocol? = APIRouter(url: url)
//                             filmService?.fetchFilm { [weak self] result in
//                                 DispatchQueue.main.async {
//                                     switch result {
//                                     case .success(let film):
//                                         self?.inititializeFilmsIfNeeded(index: j, film: film)
//                                         group.leave()
//                                     case .failure(let error):
//                                         completion?(Result.failure(error))
//                                         group.leave()
//                                     }
//                                 }
//                             }
//                         }
//                         group.leave()
//                     }
//                 }
//                 group.leave()
//             })
//             group.wait()
//             print("updateB done")
//         }
//         queue.addOperation(updateB)
         let doSomethingWithAandB = BlockOperation {
             print("doSomethingWithAandB")
//             completion?(Result.success(true))
             
         }
         doSomethingWithAandB.addDependency(updateA)
//         doSomethingWithAandB.addDependency(updateB)
         queue.addOperation(doSomethingWithAandB)
         
         queue.waitUntilAllOperationsAreFinished()
         completion?(Result.success(true))
     }
}

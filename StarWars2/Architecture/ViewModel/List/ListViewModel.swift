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
    var starWarsItem: StarWars = .planets
    var data: [PlanetModel] = []
    let planetsGroup = DispatchGroup()
    
    // MARK: - Output
    var onErrorHandling: ((ErrorResult?) -> Void)?
    var selectedItem: Planets?
    var navigationTitle: String? {
        if planetFromCoreData.count > 0 {
            return (starWarsItem.description) + "(\(planetFromCoreData.count) records)"
        } else if planetFromCoreData.count > 0 {
            return (starWarsItem.description) + "(\(data.count) records)"
        } else {
            return "Loading..."
        }
    }
    var planetFromCoreData: [Planets] = []
    
    func selectItem(index: Int, _ completion: ((Planets?) -> Void)?) {
        selectedItem = CoreDataHelper.getSelectedItem(name: self.planetFromCoreData[index].name ?? "")
        completion?(selectedItem)
    }
    
    func fetchData(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        getListData(completion)
    }
    
}

extension ListViewModel {
    
    func inititializeResidentsIfNeeded(index: Int, resident: PeopleModel) {
        if self.data[index].residentArray == nil {
            self.data[index].residentArray = []
        }
        self.data[index].residentArray?.append(resident)
    }
    
    func inititializeFilmsIfNeeded(index: Int, film: FilmModel) {
        if self.data[index].filmArray == nil {
            self.data[index].filmArray = []
        }
        self.data[index].filmArray?.append(film)
    }
    
}

private extension ListViewModel {
    private func getListData(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        if let count = CoreDataHelper.numberOfPlanets(), count > 0 {
            self.planetFromCoreData = CoreDataHelper.getAllPlanets()
            completion?(Result.success(true))
        } else {
            callListAPI(completion)
        }
    }
}

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
    var data: [PlanetModel] { get }
}


class ListViewModel: ListViewModelProtocol {
    
    // MARK: - Input
    private var service: PlanetRouterProtocol? = PlanetRouter()
    var starWarsItem: StarWars = .planets
    
    //MARK: - Output
    var data: [PlanetModel] = []
    var onErrorHandling: ((ErrorResult?) -> Void)?
    
    func fetchData(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        guard let service = self.service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        
        service.fetchConverter { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    if let results = converter.results {
                        self?.data = results
                        completion?(Result.success(true))
                    } else {
                        self?.onErrorHandling?(ErrorResult.parser(string: "unable to parse"))
                        completion?(Result.failure(ErrorResult.parser(string: "unable to parse")))
                    }
                case .failure(let error) :
                    self?.onErrorHandling?(error)
                    completion?(Result.failure(error))
                }
            }
        }
    }
    
}

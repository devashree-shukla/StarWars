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
    var navigationTitle: String? { get }
}


class ListViewModel: ListViewModelProtocol {
    
    // MARK: - Input
    private var service: PlanetRouterProtocol?
    var starWarsItem: StarWars = .planets
    
    //MARK: - Output
    var data: [PlanetModel] = []
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
                        if let results = converter.results {
                            self?.data = results
                            completion?(Result.success(true))
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
    
}

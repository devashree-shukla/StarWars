//
//  PlanetRouter.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation


final class PlanetRouter: NetworkHandler, PlanetRouterProtocol {

    private let endpoint = APIManager.allPlanetsURL
    var task: URLSessionTask?
    private var networking: NetworkingDataSource!

    init(withNetworking networking: NetworkingDataSource = NetworkService()) {
        self.networking = networking
    }

    
    func fetchConverter(_ completion: @escaping ((Result<BaseModel, ErrorResult>) -> Void)) {
        self.cancelFetchService()
        print(endpoint.absoluteString)
        task = self.networking.loadData(url: endpoint, completion: self.networkResult(completion: completion))
    }
    

    func cancelFetchService() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}


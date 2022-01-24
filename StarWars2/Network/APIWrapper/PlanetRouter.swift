//
//  PlanetRouter.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation


final class PlanetRouter: NetworkHandler, RouterProtocol {

    private let endpoint: URL?
    var task: URLSessionTask?
    private var networking: NetworkingDataSource!

    init(withNetworking networking: NetworkingDataSource = NetworkService(), type: StarWars) {
        self.networking = networking
        self.endpoint = APIManager.starWarsAPI(type: type)
    }

    
    func fetchConverter(_ completion: @escaping ((Result<BaseModel, ErrorResult>) -> Void)) {
        self.cancelFetchService()
        print(endpoint?.absoluteString)
        guard let endpoint = endpoint else {
            return
        }
        task = self.networking.loadData(url: endpoint, completion: self.networkResult(completion: completion))
    }
    

    func cancelFetchService() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}


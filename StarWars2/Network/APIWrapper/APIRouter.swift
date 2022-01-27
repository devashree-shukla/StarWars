//
//  APIRouter.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

final class APIRouter: NetworkHandler, RouterProtocol {

    private let endpoint: URL?
    var task: URLSessionTask?
    private var networking: NetworkingDataSource!

    init(withNetworking networking: NetworkingDataSource = NetworkService(), type: StarWars) {
        self.networking = networking
        self.endpoint = type.starWarsAPI
    }

    init(withNetworking networking: NetworkingDataSource = NetworkService(), url: URL) {
        self.networking = networking
        self.endpoint = url
    }

    func fetchConverter(_ completion: @escaping ((Result<BaseModel, ErrorResult>) -> Void)) {
        self.cancelFetchService()
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

extension APIRouter {

    func fetchPeople(_ completion: @escaping ((Result<PeopleModel, ErrorResult>) -> Void)) {
        guard let endpoint = endpoint else {
            return
        }
        task = self.networking.loadData(url: endpoint, completion: self.networkResult(completion: completion))
    }

    func fetchFilm(_ completion: @escaping ((Result<FilmModel, ErrorResult>) -> Void)) {
        guard let endpoint = endpoint else {
            return
        }
        task = self.networking.loadData(url: endpoint, completion: self.networkResult(completion: completion))
    }

}

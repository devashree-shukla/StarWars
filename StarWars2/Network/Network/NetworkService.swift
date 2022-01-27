//
//  NetworkService.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

final class NetworkService: NetworkingDataSource {
    private var session: URLSession!

    init(_ session: URLSession = URLSession(configuration: .default)) {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 60.0
        self.session = URLSession(configuration: sessionConfig)
    }

    func loadData(url: URL, completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        var request = NetworkMethod.request(method: .GET, url: url)
        if let reachability =  try? Reachability(),
        reachability.connection == .unavailable {
            request.cachePolicy = .returnCacheDataDontLoad
        }
        let task = self.session.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completion(.failure(.network(string: "An error occured during request :" + error.localizedDescription)))
                return
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
    }
}

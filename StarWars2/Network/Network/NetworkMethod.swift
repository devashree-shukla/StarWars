//
//  NetworkService.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

final class NetworkMethod {
    enum Method: String {
        case GET, POST, PUT, DELETE, PATCH
    }

    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

//
//  net.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

protocol NetworkingDataSource: AnyObject {
    func loadData(url: URL, completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask?
}

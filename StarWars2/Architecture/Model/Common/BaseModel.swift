//
//  BaseModel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

// MARK: - Base model

struct BaseModel: Codable {

    let count: Int
    let next: String
    let previous: String?
    let results: [PlanetModel]

    init(count: Int, next: String, previous: String?, results: [PlanetModel]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }

}

extension BaseModel: Parceable {

    static func parseObject(data: Data) -> Result<BaseModel, ErrorResult> {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let result = try? decoder.decode(BaseModel.self, from: data) {
                return Result.success(result)
            } else {
                return Result.failure(ErrorResult.parser(string: "Unable to parse flickr results"))
            }
        }

}

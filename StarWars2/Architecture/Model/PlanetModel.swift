//
//  PlanetModel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

struct PlanetModel: Codable, Equatable {
    let name, population: String
    let climate, diameter, gravity, surfacewater: String
    let orbitalPeriod, rotationPeriod: String
    let films, residents: [String]
    let created, edited: String
}


extension PlanetModel: Parceable {

    static func parseObject(data: Data) -> Result<PlanetModel, ErrorResult> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let result = try? decoder.decode(PlanetModel.self, from: data) {
            return Result.success(result)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse flickr results"))
        }
    }

}


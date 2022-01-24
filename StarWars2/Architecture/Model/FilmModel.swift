//
//  Filmmodel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

struct FilmModel: Codable, Equatable {
    let director, producer: String
//    let episodeid: String //TODO: Fix it later as it is crashing in API call
    let title: String
    let characters, species, vehicles, starships, planets: [String]
    let created, edited: String
}

extension FilmModel: Parceable {
    
    static func parseObject(data: Data) -> Result<FilmModel, ErrorResult> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let result = try? decoder.decode(FilmModel.self, from: data) {
            return Result.success(result)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse flickr results"))
        }
    }

}

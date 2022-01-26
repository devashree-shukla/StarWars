//
//  Filmmodel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation
import CoreData


struct FilmModel: Codable {
    
    let director, producer: String
    let episodeId: Int
    let openingCrawl: String
    let releaseDate: String
    let title: String
    let characters, species, vehicles, starships, planets: [String]
    let created, edited: String
    
    var planetsArray: [PlanetModel]?
    var charactersArray: [PeopleModel]?
    var speciesArray: [SpicesModel]?
    var vehiclesArray: [VehicleModel]?
    var starshipsArray: [StarshipModel]?
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

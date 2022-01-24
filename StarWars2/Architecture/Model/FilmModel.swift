//
//  Filmmodel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

struct FilmModel: Codable, Equatable {
    let director, episodeId, producer: String
    let openingCrawl, title: String
    let characters, species, vehicles, starships, planets: [String]
    let created, edited, releaseDate: String
}

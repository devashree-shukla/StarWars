//
//  ListModel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation


struct PlanetListModel {
    let planets: PlanetModel
    var residents: [PeopleModel]?
    var films: [FilmModel]?
}


struct PeopleListModel {
    let people: PeopleModel
    var films: [FilmModel]?
}


struct FilmsListModel {
    let films: [FilmModel]
    var planets: [PlanetModel]?
    var characters: [PeopleModel]?
}

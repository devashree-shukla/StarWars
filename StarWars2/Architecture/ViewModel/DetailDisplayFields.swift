//
//  DetailDisplayFields.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation

enum DetailDisplayFields: String {
    case name 
    case population
    case orbitalPeriod
    case rotationPeriod
    case climate
    case diameter
    case gravity
    case surfaceWater
    case terrain
    case films
    case residents
    case created
    case edited
    
    
    static func getDisplayFields(type: StarWars) -> [DetailDisplayFields] {
        switch type {
        case .planets:
            return getPlanetsDetailDisplayFields()
        case .people: return []
        case .films: return []
        case .starships: return []
        case .spices: return []
        case .vehicles: return []
        }
    }
    
}


extension DetailDisplayFields {
    
    private static func getPlanetsDetailDisplayFields() -> [DetailDisplayFields] {
        [DetailDisplayFields.name, DetailDisplayFields.population, DetailDisplayFields.orbitalPeriod,
         DetailDisplayFields.rotationPeriod, DetailDisplayFields.climate, DetailDisplayFields.diameter, DetailDisplayFields.gravity, DetailDisplayFields.surfaceWater, DetailDisplayFields.terrain, DetailDisplayFields.films, DetailDisplayFields.residents, DetailDisplayFields.created, DetailDisplayFields.edited]
    }
    
}

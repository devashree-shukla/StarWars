//
//  StarWars.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

enum StarWars: CustomStringConvertible, CaseIterable {
    case planets
    case people
    case films
    case starships
    case spices
    case vehicles
    
    
    var description: String {
        switch self {
        case .planets: return "Planets"
        case .people: return "People"
        case .films: return "Films"
        case .starships: return "Starships"
        case .spices: return "Spices"
        case .vehicles: return "Vehicles"
        }
    }
    
    
    var serviceName: PlanetRouterProtocol? {
        switch self {
        case .planets: return PlanetRouter()
        case .people: return nil
        case .films: return nil
        case .starships: return nil
        case .spices: return nil
        case .vehicles: return nil
        }
    }
}


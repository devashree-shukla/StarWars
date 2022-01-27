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

    var serviceName: RouterProtocol? {
        switch self {
        case .planets: return APIRouter(type: .planets)
        case .people: return APIRouter(type: .people)
        case .films: return APIRouter(type: .films)
        case .starships: return APIRouter(type: .starships)
        case .spices: return APIRouter(type: .spices)
        case .vehicles: return APIRouter(type: .vehicles)
        }
    }

    var starWarsAPI: URL? {
        switch self {
        case .planets: return APIManager.allPlanetsURL
        case .people: return APIManager.allPeopleURL
        case .films: return APIManager.allFilmsURL
        case .starships: return APIManager.allStarshipsURL
        case .spices: return APIManager.allSpeciesURL
        case .vehicles: return APIManager.allVehiclesURL
        }
    }
}

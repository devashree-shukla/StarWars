//
//  APIManager.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

enum Method: String {
    case allPersons = "people/"
    case allFilms = "films/"
    case allPlanets = "planets/"
    case allSpecies = "species/"
    case allStarships = "starships/"
    case allVehicles = "vehicles/"
}


struct APIManager {
    private static let baseURLString = "https://swapi.dev/api/"

    static var allFilmsURL: URL {
        return starWarsAPIURL(method: .allFilms)
    }

    
    static var allPersonsURL: URL {
        return starWarsAPIURL(method: .allPersons)
    }

    
    static var allPlanetsURL: URL {
        return starWarsAPIURL(method: .allPlanets)
    
    }

    static var allSpeciesURL: URL {
        return starWarsAPIURL(method: .allSpecies)
    }

    
    static var allStarshipsURL: URL {
        return starWarsAPIURL(method: .allStarships)
    }

    
    static var allVehiclesURL: URL {
        return starWarsAPIURL(method: .allVehicles)
    }

    
    // MARK: - General Methods
    
    private static func starWarsAPIURL(method: Method) -> URL {
        let baseURL = URL(string: baseURLString)!
        let finalURL = URL(string: method.rawValue, relativeTo: baseURL)!
        return finalURL
    }
}


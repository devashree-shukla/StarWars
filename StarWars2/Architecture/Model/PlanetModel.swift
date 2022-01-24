//
//  PlanetModel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

struct PlanetModel: Codable, Equatable {
    let name, population: String
    let films, residents: [String]
    let created, edited: String
    let climate: String
    let diameter: String
    let gravity: String
    let surfaceWater: String
    let orbitalPeriod, rotationPeriod: String
    let terrain: String
    
    var planetDescription: String {
        "Having \(residents.count) residents and appeared in \(films.count) films. Also, having \(climate) and \(surfaceWater) % water sources "
    }
    
    
    var asDictionary : [String: Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({
            (label:String?, value:Any) -> (String, Any)? in
          guard let label = label else { return nil }
          return (label, value)
        }).compactMap { $0 })
        return dict
    }
}


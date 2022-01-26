//
//  s.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation


@objc(FilmsNSSecureCoding)
public class FilmsNSSecureCoding: NSObject, NSSecureCoding {
    
    public static var supportsSecureCoding: Bool = true
    
    var charactersList: [Residents]?
    var planetsList: [Planets]?
    var spicesList: [Spices]?
    var starshipsList: [Starships]?
    var vehiclesList: [Vehicles]?

    
    required init(charactersList: [Residents]?, planetsList: [Planets]?, spicesList: [Spices]?,
                  starshipsList: [Starships]?, vehiclesList: [Vehicles]?) {
        self.charactersList = charactersList
        self.planetsList = planetsList
        self.spicesList = spicesList
        self.starshipsList = starshipsList
        self.vehiclesList = vehiclesList
    }
    
    
    public func encode(with coder: NSCoder) {
        coder.encode(charactersList, forKey: "characters")
        coder.encode(planetsList, forKey: "planets")
//        coder.encode(spicesList, forKey: "spices")
//        coder.encode(starshipsList, forKey: "starships")
//        coder.encode(vehiclesList, forKey: "vehicles")
    }
    
    
    required public init?(coder: NSCoder) {
        
        charactersList = coder.decodeObject(of: NSArray.self, forKey: "characters") as? Array<Residents> ?? []
        planetsList = coder.decodeObject(of: NSArray.self, forKey: "planets") as? Array<Planets> ?? []
//        spicesList = coder.decodeObject(of: NSArray.self, forKey: "spices") as? Array<Spices> ?? []
//        starshipsList = coder.decodeObject(of: NSArray.self, forKey: "starships") as? Array<Starships> ?? []
//        vehiclesList = coder.decodeObject(of: NSArray.self, forKey: "vehicles") as? Array<Vehicles> ?? []

    }
    
}

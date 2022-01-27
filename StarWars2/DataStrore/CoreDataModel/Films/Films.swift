//
//  Films.swift
//  StarWars2
//
//  Created by Devashree KS on 25/01/22.
//

import Foundation
import CoreData

public class Films: NSManagedObject {

}

extension Films {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Films> {
        return NSFetchRequest<Films>(entityName: StarWars.films.entityName)
    }

    @NSManaged public var characters: [Residents]?
    @NSManaged public var created: Date?
    @NSManaged public var director: String?
    @NSManaged public var edited: Date?
    @NSManaged public var episodeid: String?
    @NSManaged public var openingCrawl: String?
    @NSManaged public var planets: [Planets]?
    @NSManaged public var producer: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var species: [Spices]?
    @NSManaged public var starships: [Starships]?
    @NSManaged public var title: String?
    @NSManaged public var vehicles: [Vehicles]?
    @NSManaged public var relatedCharacters: NSSet?
    @NSManaged public var relatedPlanets: NSSet?
    @NSManaged public var relatedSpices: NSSet?
    @NSManaged public var relatedStarships: NSSet?
    @NSManaged public var relatedVehicles: NSSet?

}

// MARK: Generated accessors for relatedCharacters
extension Films {

    @objc(addRelatedCharactersObject:)
    @NSManaged public func addToRelatedCharacters(_ value: Residents)

    @objc(removeRelatedCharactersObject:)
    @NSManaged public func removeFromRelatedCharacters(_ value: Residents)

    @objc(addRelatedCharacters:)
    @NSManaged public func addToRelatedCharacters(_ values: NSSet)

    @objc(removeRelatedCharacters:)
    @NSManaged public func removeFromRelatedCharacters(_ values: NSSet)

}

// MARK: Generated accessors for relatedPlanets
extension Films {

    @objc(addRelatedPlanetsObject:)
    @NSManaged public func addToRelatedPlanets(_ value: Planets)

    @objc(removeRelatedPlanetsObject:)
    @NSManaged public func removeFromRelatedPlanets(_ value: Planets)

    @objc(addRelatedPlanets:)
    @NSManaged public func addToRelatedPlanets(_ values: NSSet)

    @objc(removeRelatedPlanets:)
    @NSManaged public func removeFromRelatedPlanets(_ values: NSSet)

}

// MARK: Generated accessors for relatedSpices
extension Films {

    @objc(addRelatedSpicesObject:)
    @NSManaged public func addToRelatedSpices(_ value: Spices)

    @objc(removeRelatedSpicesObject:)
    @NSManaged public func removeFromRelatedSpices(_ value: Spices)

    @objc(addRelatedSpices:)
    @NSManaged public func addToRelatedSpices(_ values: NSSet)

    @objc(removeRelatedSpices:)
    @NSManaged public func removeFromRelatedSpices(_ values: NSSet)

}

// MARK: Generated accessors for relatedStarships
extension Films {

    @objc(addRelatedStarshipsObject:)
    @NSManaged public func addToRelatedStarships(_ value: Starships)

    @objc(removeRelatedStarshipsObject:)
    @NSManaged public func removeFromRelatedStarships(_ value: Starships)

    @objc(addRelatedStarships:)
    @NSManaged public func addToRelatedStarships(_ values: NSSet)

    @objc(removeRelatedStarships:)
    @NSManaged public func removeFromRelatedStarships(_ values: NSSet)

}

// MARK: Generated accessors for relatedVehicles
extension Films {

    @objc(addRelatedVehiclesObject:)
    @NSManaged public func addToRelatedVehicles(_ value: Vehicles)

    @objc(removeRelatedVehiclesObject:)
    @NSManaged public func removeFromRelatedVehicles(_ value: Vehicles)

    @objc(addRelatedVehicles:)
    @NSManaged public func addToRelatedVehicles(_ values: NSSet)

    @objc(removeRelatedVehicles:)
    @NSManaged public func removeFromRelatedVehicles(_ values: NSSet)

}

extension Films: Identifiable {

}

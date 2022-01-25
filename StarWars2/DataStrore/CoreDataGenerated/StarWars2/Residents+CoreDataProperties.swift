//
//  Residents+CoreDataProperties.swift
//  
//
//  Created by Devashree KS on 25/01/22.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Residents {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Residents> {
        return NSFetchRequest<Residents>(entityName: "Residents")
    }

    @NSManaged public var birthYear: String?
    @NSManaged public var created: Date?
    @NSManaged public var edited: Date?
    @NSManaged public var eyeColor: String?
    @NSManaged public var films: NSObject?
    @NSManaged public var gender: String?
    @NSManaged public var hairColor: String?
    @NSManaged public var height: String?
    @NSManaged public var homeworld: String?
    @NSManaged public var mass: String?
    @NSManaged public var name: String?
    @NSManaged public var skinColor: String?
    @NSManaged public var species: NSObject?
    @NSManaged public var starships: NSObject?
    @NSManaged public var vehicles: NSObject?
    @NSManaged public var relatedFilms: NSSet?
    @NSManaged public var relatedSpices: NSSet?
    @NSManaged public var relatedStarships: NSSet?
    @NSManaged public var relatedVehicles: NSSet?

}

// MARK: Generated accessors for relatedFilms
extension Residents {

    @objc(addRelatedFilmsObject:)
    @NSManaged public func addToRelatedFilms(_ value: Films)

    @objc(removeRelatedFilmsObject:)
    @NSManaged public func removeFromRelatedFilms(_ value: Films)

    @objc(addRelatedFilms:)
    @NSManaged public func addToRelatedFilms(_ values: NSSet)

    @objc(removeRelatedFilms:)
    @NSManaged public func removeFromRelatedFilms(_ values: NSSet)

}

// MARK: Generated accessors for relatedSpices
extension Residents {

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
extension Residents {

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
extension Residents {

    @objc(addRelatedVehiclesObject:)
    @NSManaged public func addToRelatedVehicles(_ value: Vehicles)

    @objc(removeRelatedVehiclesObject:)
    @NSManaged public func removeFromRelatedVehicles(_ value: Vehicles)

    @objc(addRelatedVehicles:)
    @NSManaged public func addToRelatedVehicles(_ values: NSSet)

    @objc(removeRelatedVehicles:)
    @NSManaged public func removeFromRelatedVehicles(_ values: NSSet)

}

extension Residents : Identifiable {

}

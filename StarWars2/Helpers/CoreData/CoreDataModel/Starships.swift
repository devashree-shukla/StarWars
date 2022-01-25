//
//  Starships.swift
//  StarWars2
//
//  Created by Devashree KS on 25/01/22.
//

import Foundation
import CoreData


public class Starships: NSManagedObject {

}


extension Starships {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Starships> {
        return NSFetchRequest<Starships>(entityName: "Starships")
    }

    @NSManaged public var cargoCapacity: String?
    @NSManaged public var consumables: String?
    @NSManaged public var costInCredits: String?
    @NSManaged public var created: Date?
    @NSManaged public var crew: String?
    @NSManaged public var edited: Date?
    @NSManaged public var films: [Films]?
    @NSManaged public var hyperdriveRating: String?
    @NSManaged public var length: String?
    @NSManaged public var manufacturer: String?
    @NSManaged public var maxAtmospheringSpeed: String?
    @NSManaged public var mglt: String?
    @NSManaged public var model: String?
    @NSManaged public var name: String?
    @NSManaged public var passengers: String?
    @NSManaged public var pilots: [Residents]?
    @NSManaged public var starshipClass: String?
    @NSManaged public var relatedFilms: NSSet?
    @NSManaged public var relatedPilots: NSSet?

}

// MARK: Generated accessors for relatedFilms
extension Starships {

    @objc(addRelatedFilmsObject:)
    @NSManaged public func addToRelatedFilms(_ value: Films)

    @objc(removeRelatedFilmsObject:)
    @NSManaged public func removeFromRelatedFilms(_ value: Films)

    @objc(addRelatedFilms:)
    @NSManaged public func addToRelatedFilms(_ values: NSSet)

    @objc(removeRelatedFilms:)
    @NSManaged public func removeFromRelatedFilms(_ values: NSSet)

}

// MARK: Generated accessors for relatedPilots
extension Starships {

    @objc(addRelatedPilotsObject:)
    @NSManaged public func addToRelatedPilots(_ value: Residents)

    @objc(removeRelatedPilotsObject:)
    @NSManaged public func removeFromRelatedPilots(_ value: Residents)

    @objc(addRelatedPilots:)
    @NSManaged public func addToRelatedPilots(_ values: NSSet)

    @objc(removeRelatedPilots:)
    @NSManaged public func removeFromRelatedPilots(_ values: NSSet)

}

extension Starships : Identifiable {

}


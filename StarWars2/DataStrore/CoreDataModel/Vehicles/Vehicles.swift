//
//  Vehicles.swift
//  StarWars2
//
//  Created by Devashree KS on 25/01/22.
//

import Foundation
import CoreData

@objc(Vehicles)
public class Vehicles: NSManagedObject {

}

extension Vehicles {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vehicles> {
        return NSFetchRequest<Vehicles>(entityName: StarWars.vehicles.entityName)
    }

    @NSManaged public var cargoCapacity: String?
    @NSManaged public var consumables: String?
    @NSManaged public var costInCredits: String?
    @NSManaged public var created: Date?
    @NSManaged public var crew: String?
    @NSManaged public var edited: Date?
    @NSManaged public var films: VehiclesNSSecureCoding?
    @NSManaged public var length: String?
    @NSManaged public var manufacturer: String?
    @NSManaged public var maxAtmospheringSpeed: String?
    @NSManaged public var model: String?
    @NSManaged public var name: String?
    @NSManaged public var passengers: String?
    @NSManaged public var pilots: VehiclesNSSecureCoding?
    @NSManaged public var vehicleClass: String?
    @NSManaged public var relatedFilms: NSSet?
    @NSManaged public var relatedPilots: NSSet?

}

// MARK: Generated accessors for relatedFilms
extension Vehicles {

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
extension Vehicles {

    @objc(addRelatedPilotsObject:)
    @NSManaged public func addToRelatedPilots(_ value: Residents)

    @objc(removeRelatedPilotsObject:)
    @NSManaged public func removeFromRelatedPilots(_ value: Residents)

    @objc(addRelatedPilots:)
    @NSManaged public func addToRelatedPilots(_ values: NSSet)

    @objc(removeRelatedPilots:)
    @NSManaged public func removeFromRelatedPilots(_ values: NSSet)

}

extension Vehicles: Identifiable {

}

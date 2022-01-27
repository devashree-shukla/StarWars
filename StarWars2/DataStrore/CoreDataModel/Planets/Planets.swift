//
//  Planets.swift
//  StarWars2
//
//  Created by Devashree KS on 25/01/22.
//

import Foundation
import CoreData

public class Planets: NSManagedObject {

}

extension Planets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planets> {
        return NSFetchRequest<Planets>(entityName: StarWars.planets.entityName)
    }

    @NSManaged public var climate: String?
    @NSManaged public var created: Date?
    @NSManaged public var diameter: String?
    @NSManaged public var edited: Date?
    @NSManaged public var films: [Films]?
    @NSManaged public var gravity: String?
    @NSManaged public var name: String?
    @NSManaged public var orbitalPeriod: String?
    @NSManaged public var population: String?
    @NSManaged public var residents: [Residents]?
    @NSManaged public var rotationPeriod: String?
    @NSManaged public var surfaceWater: String?
    @NSManaged public var terrain: String?
    @NSManaged public var relatedFilms: NSSet?
    @NSManaged public var relatedResidents: NSSet?

}

// MARK: Generated accessors for relatedFilms
extension Planets {

    @objc(addRelatedFilmsObject:)
    @NSManaged public func addToRelatedFilms(_ value: Films)

    @objc(removeRelatedFilmsObject:)
    @NSManaged public func removeFromRelatedFilms(_ value: Films)

    @objc(addRelatedFilms:)
    @NSManaged public func addToRelatedFilms(_ values: NSSet)

    @objc(removeRelatedFilms:)
    @NSManaged public func removeFromRelatedFilms(_ values: NSSet)

}

// MARK: Generated accessors for relatedResidents
extension Planets {

    @objc(addRelatedResidentsObject:)
    @NSManaged public func addToRelatedResidents(_ value: Residents)

    @objc(removeRelatedResidentsObject:)
    @NSManaged public func removeFromRelatedResidents(_ value: Residents)

    @objc(addRelatedResidents:)
    @NSManaged public func addToRelatedResidents(_ values: NSSet)

    @objc(removeRelatedResidents:)
    @NSManaged public func removeFromRelatedResidents(_ values: NSSet)

}

extension Planets: Identifiable {

}

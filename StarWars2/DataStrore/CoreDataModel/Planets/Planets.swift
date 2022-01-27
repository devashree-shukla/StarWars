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
    @NSManaged public var films: FilmsNSSecureCoding?
    @NSManaged public var gravity: String?
    @NSManaged public var name: String?
    @NSManaged public var orbitalPeriod: String?
    @NSManaged public var population: String?
    @NSManaged public var people: PeopleNSSecureCoding?
    @NSManaged public var rotationPeriod: String?
    @NSManaged public var surfaceWater: String?
    @NSManaged public var terrain: String?
    @NSManaged public var relatedFilms: NSSet?
    @NSManaged public var relatedResidents: NSSet?

}


extension Planets: Identifiable {

}

//
//  Residents.swift
//  StarWars2
//
//  Created by Devashree KS on 25/01/22.
//

import Foundation
import CoreData

public class Residents: NSManagedObject {

}

extension Residents {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Residents> {
        return NSFetchRequest<Residents>(entityName: StarWars.people.entityName)
    }

    @NSManaged public var birthYear: String?
    @NSManaged public var created: Date?
    @NSManaged public var edited: Date?
    @NSManaged public var eyeColor: String?
    @NSManaged public var films: FilmsNSSecureCoding?
    @NSManaged public var gender: String?
    @NSManaged public var hairColor: String?
    @NSManaged public var height: String?
    @NSManaged public var homeworld: String?
    @NSManaged public var mass: String?
    @NSManaged public var name: String?
    @NSManaged public var skinColor: String?
    @NSManaged public var species: [Spices]?
    @NSManaged public var starships: [Starships]?
    @NSManaged public var vehicles: [Vehicles]?
    @NSManaged public var relatedFilms: NSSet?
    @NSManaged public var relatedSpices: NSSet?
    @NSManaged public var relatedStarships: NSSet?
    @NSManaged public var relatedVehicles: NSSet?

}

extension Residents: Identifiable {

}

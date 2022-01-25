//
//  Spices.swift
//  StarWars2
//
//  Created by Devashree KS on 25/01/22.
//

import Foundation
import CoreData

@objc(Spices)
public class Spices: NSManagedObject {

}


extension Spices {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Spices> {
        return NSFetchRequest<Spices>(entityName: "Spices")
    }

    @NSManaged public var averageHeight: String?
    @NSManaged public var averageLifespan: String?
    @NSManaged public var classification: String?
    @NSManaged public var created: Date?
    @NSManaged public var designation: String?
    @NSManaged public var edited: Date?
    @NSManaged public var eyeColors: String?
    @NSManaged public var films: [Films]?
    @NSManaged public var hairColors: String?
    @NSManaged public var homeworld: String?
    @NSManaged public var language: String?
    @NSManaged public var name: String?
    @NSManaged public var people: [Residents]?
    @NSManaged public var skinColors: String?
    @NSManaged public var relatedFilms: NSSet?
    @NSManaged public var relatedPeople: NSSet?

}

// MARK: Generated accessors for relatedFilms
extension Spices {

    @objc(addRelatedFilmsObject:)
    @NSManaged public func addToRelatedFilms(_ value: Films)

    @objc(removeRelatedFilmsObject:)
    @NSManaged public func removeFromRelatedFilms(_ value: Films)

    @objc(addRelatedFilms:)
    @NSManaged public func addToRelatedFilms(_ values: NSSet)

    @objc(removeRelatedFilms:)
    @NSManaged public func removeFromRelatedFilms(_ values: NSSet)

}

// MARK: Generated accessors for relatedPeople
extension Spices {

    @objc(addRelatedPeopleObject:)
    @NSManaged public func addToRelatedPeople(_ value: Residents)

    @objc(removeRelatedPeopleObject:)
    @NSManaged public func removeFromRelatedPeople(_ value: Residents)

    @objc(addRelatedPeople:)
    @NSManaged public func addToRelatedPeople(_ values: NSSet)

    @objc(removeRelatedPeople:)
    @NSManaged public func removeFromRelatedPeople(_ values: NSSet)

}

extension Spices : Identifiable {

}


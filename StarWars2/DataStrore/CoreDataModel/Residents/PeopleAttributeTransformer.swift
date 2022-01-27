//
//  PeopleAttributeTransformer.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation

@objc(PeopleAttributeTransformer)
class PeopleAttributeTransformer: NSSecureUnarchiveFromDataTransformer {

    override static var allowedTopLevelClasses: [AnyClass] {
        [Films.self, Spices.self, Starships.self, Vehicles.self]
    }

    static func register() {
        let className = String(describing: PeopleAttributeTransformer.self)
        let name = NSValueTransformerName(className)

        let transformer = PeopleAttributeTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }

}

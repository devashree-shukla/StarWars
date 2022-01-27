//
//  FilmsAttributeTransformer.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation

@objc(FilmsAttributeTransformer)
class FilmsAttributeTransformer: NSSecureUnarchiveFromDataTransformer {

    override static var allowedTopLevelClasses: [AnyClass] {
        [Residents.self, Spices.self, Starships.self, Vehicles.self, Planets.self]
    }

    static func register() {
        let className = String(describing: FilmsAttributeTransformer.self)
        let name = NSValueTransformerName(className)

        let transformer = FilmsAttributeTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }

}

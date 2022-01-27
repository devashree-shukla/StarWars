//
//  PlanetsAttributeTransformer.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation

@objc(PlanetsAttributeTransformer)
class PlanetsAttributeTransformer: NSSecureUnarchiveFromDataTransformer {

    override static var allowedTopLevelClasses: [AnyClass] {
        [Residents.self, Films.self, Planets.self]
    }

    static func register() {
        let className = String(describing: PlanetsAttributeTransformer.self)
        let name = NSValueTransformerName(className)

        let transformer = PlanetsAttributeTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }

}

//
//  VehiclesAttributeTransformer.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation

@objc(VehiclesAttributeTransformer)
class VehiclesAttributeTransformer: NSSecureUnarchiveFromDataTransformer {

    override static var allowedTopLevelClasses: [AnyClass] {
        [Residents.self, Films.self]
    }

    static func register() {
        let className = String(describing: VehiclesAttributeTransformer.self)
        let name = NSValueTransformerName(className)

        let transformer = VehiclesAttributeTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }

}

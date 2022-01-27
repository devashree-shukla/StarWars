//
//  SpicesAttributeTransformer.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation

@objc(SpicesAttributeTransformer)
class SpicesAttributeTransformer: NSSecureUnarchiveFromDataTransformer {

    override static var allowedTopLevelClasses: [AnyClass] {
        [Residents.self, Films.self]
    }

    static func register() {
        let className = String(describing: SpicesAttributeTransformer.self)
        let name = NSValueTransformerName(className)

        let transformer = SpicesAttributeTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }

}

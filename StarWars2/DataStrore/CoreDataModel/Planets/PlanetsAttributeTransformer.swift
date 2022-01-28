//
//  PlanetsAttributeTransformer.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation

class PlanetsAttributeTransformer: NSSecureUnarchiveFromDataTransformer {

    override class func allowsReverseTransformation() -> Bool {
        return true
    }

    override class func transformedValueClass() -> AnyClass {
        return NSArray.self
    }

    override class var allowedTopLevelClasses: [AnyClass] {
        return [Residents.self, NSArray.self, Planets.self, Films.self]
    }
    
    static func register() {
         let className = String(describing: PlanetsAttributeTransformer.self)
         let name = NSValueTransformerName(className)

         let transformer = PlanetsAttributeTransformer()
         ValueTransformer.setValueTransformer(transformer, forName: name)
     }

    override func transformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {
            return nil
        }
        return super.transformedValue(data)
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let color = value as? [Planets] else {
            return nil 
        }
        return super.reverseTransformedValue(color)
    }
}

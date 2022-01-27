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
        [Residents.self, NSArray.self, Planets.self, Films.self]
    }

    static func register() {
        let className = String(describing: FilmsAttributeTransformer.self)
        let name = NSValueTransformerName(className)

        let transformer = FilmsAttributeTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }

    override class func allowsReverseTransformation() -> Bool {
        return true
    }

    override class func transformedValueClass() -> AnyClass {
        return NSArray.self
    }

    override func transformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {
            return nil //fatalError("Wrong data type: value must be a Data object; received \(type(of: value))")
        }
        return super.transformedValue(data)
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let color = value as? [Films] else {
            return nil // fatalError("Wrong data type: value must be a UIColor object; received \(type(of: value))")
        }
        return super.reverseTransformedValue(color)
    }
}

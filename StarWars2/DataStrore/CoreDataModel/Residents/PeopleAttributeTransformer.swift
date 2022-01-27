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
        [Residents.self, NSArray.self, Planets.self, Films.self]
    }

    static func register() {
        let className = String(describing: PeopleAttributeTransformer.self)
        let name = NSValueTransformerName(className)

        let transformer = PeopleAttributeTransformer()
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
        guard let color = value as? [Residents] else {
            return nil // fatalError("Wrong data type: value must be a UIColor object; received \(type(of: value))")
        }
        return super.reverseTransformedValue(color)
    }

}

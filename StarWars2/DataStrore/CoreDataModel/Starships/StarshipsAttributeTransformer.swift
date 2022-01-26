//
//  PlanetsAttributeTransformer.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation


@objc(StarshipsAttributeTransformer)
class StarshipsAttributeTransformer: NSSecureUnarchiveFromDataTransformer {
    
    override static var allowedTopLevelClasses: [AnyClass] {
        [Residents.self, Films.self]
    }
    
    
    static func register() {
        let className = String(describing: StarshipsAttributeTransformer.self)
        let name = NSValueTransformerName(className)
        
        let transformer = StarshipsAttributeTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
    
}




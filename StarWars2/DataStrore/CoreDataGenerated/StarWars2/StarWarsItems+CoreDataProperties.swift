//
//  StarWarsItems+CoreDataProperties.swift
//  
//
//  Created by Devashree KS on 25/01/22.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension StarWarsItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StarWarsItems> {
        return NSFetchRequest<StarWarsItems>(entityName: "StarWarsItems")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var itemValue: String?

}

extension StarWarsItems : Identifiable {

}

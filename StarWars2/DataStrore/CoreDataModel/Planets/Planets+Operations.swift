//
//  Planets+Operations.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation
import CoreData

extension Planets {

    class func findAll(in managedObjectContext: NSManagedObjectContext) -> [Planets] {
        let fetchRequest: NSFetchRequest<Planets> = Planets.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = true
        fetchRequest.propertiesToFetch = ["name"]
       // fetchRequest.resultType = .re
        do {
            return try managedObjectContext.fetch(fetchRequest)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }

    }

    class func getCount(in managedObjectContext: NSManagedObjectContext) -> Int? {
        let fetchRequest: NSFetchRequest<Planets> = Planets.fetchRequest()
        fetchRequest.propertiesToFetch = ["name"]
        return (try? managedObjectContext.fetch(fetchRequest).count) ?? 0
    }

}

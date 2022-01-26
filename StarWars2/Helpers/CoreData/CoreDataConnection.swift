//
//  CoreDataStack.swift
//  StarWars2
//
//  Created by Devashree KS on 25/01/22.
//

import UIKit
import CoreData


extension StarWars {
    
    var entityName: String {
        switch self {
        case .planets: return "Planets"
        case .people: return "Residents"
        case .films: return "Films"
        case .starships: return "Starships"
        case .spices: return "Spices"
        case .vehicles: return "Vehicles"
        }
    }
    
}


class CoreDataConnection: NSObject {
    
    static let sharedInstance = CoreDataConnection()
    static let kFilename = "StarWars2"
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: CoreDataConnection.kFilename)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func setup() {
        applicationDocumentsDirectory()
        PeopleAttributeTransformer.register()
        FilmsAttributeTransformer.register()
        PlanetsAttributeTransformer.register()
        SpicesAttributeTransformer.register()
        StarshipsAttributeTransformer.register()
        VehiclesAttributeTransformer.register()
    }
}

extension CoreDataConnection {
    
    private func applicationDocumentsDirectory() {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "yo.BlogReaderApp" in the application's documents directory.
        if let url = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {
            print(url.absoluteString)
        }
    }
}

    
extension CoreDataConnection {
    
    func createManagedObject(_ entityName: String) -> NSManagedObject {
        let managedContext = CoreDataConnection.sharedInstance.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext)!
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        return item
        
    }
    
    
    func saveDatabase(completion:(_ result: Bool) -> Void) {
        let managedContext = CoreDataConnection.sharedInstance.persistentContainer.viewContext
        
        do {
            try managedContext.save()
            completion(true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            completion(false)
        }
        
    }
    
    func deleteManagedObject( managedObject: NSManagedObject, completion:(_ result: Bool) -> Void) {
        
        let managedContext = CoreDataConnection.sharedInstance.persistentContainer.viewContext
        managedContext.delete(managedObject)
        do {
            try managedContext.save()
            completion(true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            completion(false)
        }
        
    }
}

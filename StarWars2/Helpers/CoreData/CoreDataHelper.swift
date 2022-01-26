//
//  CoreDataHelper.swift
//  StarWars2
//
//  Created by Devashree KS on 25/01/22.
//

import Foundation
import CoreData


class CoreDataHelper {
    
    private static let currentContext = CoreDataConnection.sharedInstance.persistentContainer.viewContext
    
    class func saveObjectsInEntity(objects: [PlanetModel], _ completion: (_ result: Bool) -> Void) {
        let obj = objects.map { createPlanet($0, context: currentContext) }
        print(obj)
        CoreDataConnection.sharedInstance.saveDatabase(completion: completion)
    }
    
    
    class func createPlanet(_ model: PlanetModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Planets",
                                                                  into: context) as? Planets {
            entity.name = model.name
            entity.diameter = model.diameter
            entity.terrain = model.terrain
            entity.surfaceWater = model.surfaceWater
            entity.rotationPeriod = model.name
            entity.orbitalPeriod = model.orbitalPeriod
            entity.population = model.population
            entity.gravity = model.gravity
            entity.edited = model.edited.toDate()
            entity.created = model.created.toDate()
            entity.climate = model.climate
            
            if let residents = model.residentArray?.map({ createPeople($0, context: context) }) as? [Residents] {
                entity.residents = residents
            }
//            if let items = model.filmArray?.map({ createFilm($0, context: context) }) as? [Films] {
//                entity.films = PlanetsNSSecureCoding(films: entit)
//            }
            return entity
        }
        return nil
    }
    
    
    class func getSelectedItem(name: String) -> Planets? {
        let fetchRequest: NSFetchRequest<Planets> = Planets.fetchRequest()
        let search = NSPredicate(format: "name == %@", name)
        print("search: \(search)")
//        fetchRequest.predicate = search
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.resultType = .managedObjectResultType
//        fetchRequest.propertiesToFetch = ["name"]
        print("request predicate: \(String(describing: fetchRequest.predicate))")
            let items = try? currentContext.fetch(fetchRequest)
            return items?.first
    }
    
    
    class func getAllPlanets() -> [Planets] {
        let planets: [Planets] = Planets.findAll(in: currentContext)
        return planets
    }
    
    
    class func numberOfPlanets() -> Int? {
        Planets.getCount(in: currentContext)
    }
    
}


extension CoreDataHelper {
    
    class func createPeople(_ model: PeopleModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Residents",
                                                                  into: context) as? Residents {
            entity.birthYear = model.birthYear
            entity.eyeColor = model.eyeColor
            entity.gender = model.gender
            entity.hairColor = model.hairColor
            entity.height = model.height
            entity.homeworld = model.homeworld
            entity.mass = model.mass
            entity.name = model.name
            entity.edited = model.edited.toDate()
            entity.created = model.created.toDate()
            entity.skinColor = model.skinColor
            
//            entity.films = model.filmArray?.map { createFilm($0, context: context) } as? [Films]
//            entity.starships = model.starshipsArray?.map { createStarships($0, context: context) } as? [Starships]
//            entity.species = model.speciesArray?.map { createSpices($0, context: context) } as? [Spices]
//            entity.vehicles = model.vehiclesArray?.map { createVehicles($0, context: context) } as? [Vehicles]
            
            return entity
        }
        return nil
    }
    
}


extension CoreDataHelper {
    
    class func createFilm(_ model: FilmModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Films", into: context) as? Films {
            entity.episodeid = model.episodeId.description
            entity.producer = model.producer
            entity.openingCrawl = model.openingCrawl
            entity.releaseDate = model.releaseDate
            entity.title = model.title
            entity.edited = model.edited.toDate()
            entity.created = model.created.toDate()
            entity.director = model.director
            
//            entity.planets = model.planetsArray?.map { createPlanet($0, context: context) } as? [Planets]
//            entity.characters = model.charactersArray?.map { createPeople($0, context: context) } as? [Residents]
//            entity.starships = model.starshipsArray?.map { createStarships($0, context: context) } as? [Starships]
//            entity.species = model.speciesArray?.map { createSpices($0, context: context) } as? [Spices]
//            entity.vehicles = model.vehiclesArray?.map { createVehicles($0, context: context) } as? [Vehicles]
            return entity
        }
        return nil
    }
    
}


extension CoreDataHelper {
    
    class func createStarship(_ model: StarshipModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Starships",
                                                                  into: context) as? Starships {
            return entity
        }
        return nil
    }
    
}


extension CoreDataHelper {
    
    class func createSpice(_ model: SpicesModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Spices",
                                                                  into: context) as? Spices {
            return entity
        }
        return nil
    }
    
}


extension CoreDataHelper {
    
    
    class func createVehicle(_ model: VehicleModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Vehicles",
                                                                  into: context) as? Vehicles {
            return entity
        }
        return nil
    }
        
}

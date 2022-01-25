//
//  CoreDataHelper.swift
//  StarWars2
//
//  Created by Devashree KS on 25/01/22.
//

import Foundation
import CoreData


class CoreDataHelper {
    
    class func createPlanetEntityFrom(_ model: PlanetModel, context: NSManagedObjectContext) -> NSManagedObject? {
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
            
            entity.films = model.filmArray?.map { createFilmEntityFrom($0, context: context) } as? [Films]
            entity.residents = model.residentArray?.map { createPeopleEntityFrom($0, context: context) } as? [Residents]

            return entity
        }
        return nil
    }
    
    
    class func saveFilmsEntityIn(_ field: String, _ model: [PeopleModel], context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Planets>
        fetchRequest = Planets.fetchRequest()

        fetchRequest.predicate = NSPredicate(
            format: "name MATCHES", field
        )

        // Perform the fetch request to get the objects
        // matching the predicate
        if let object = try? context.fetch(fetchRequest).first {
            object.residents = model.map { createPeopleEntityFrom($0, context: context) } as? [Residents]
        }
        
        do {
            try? context.save()
        } catch let error {
            print(error)
        }
    }

    
    
    class func createPeopleEntityFrom(_ model: PeopleModel, context: NSManagedObjectContext) -> NSManagedObject? {
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
            
            entity.films = model.filmArray?.map { createFilmEntityFrom($0, context: context) } as? [Films]
            entity.starships = model.starshipsArray?.map { createStarshipsEntityFrom($0, context: context) } as? [Starships]
            entity.species = model.speciesArray?.map { createSpicesEntityFrom($0, context: context) } as? [Spices]
            entity.vehicles = model.vehiclesArray?.map { createVehiclesEntityFrom($0, context: context) } as? [Vehicles]
            
            return entity
        }
        return nil
    }
    
    
    class func createFilmEntityFrom(_ model: FilmModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Film",
                                                                  into: context) as? Films {
//            entity.episodeid = model.birthYear
            entity.producer = model.producer
//            entity.openingCrawl = model.opening_crawl
//            entity.releaseDate = model.releaseDate
            entity.title = model.title
            entity.edited = model.edited.toDate()
            entity.created = model.created.toDate()
            entity.director = model.director
            
            entity.planets = model.planetsArray?.map { createPlanetEntityFrom($0, context: context) } as? [Planets]
            entity.characters = model.charactersArray?.map { createPeopleEntityFrom($0, context: context) } as? [Residents]
            entity.starships = model.starshipsArray?.map { createStarshipsEntityFrom($0, context: context) } as? [Starships]
            entity.species = model.speciesArray?.map { createSpicesEntityFrom($0, context: context) } as? [Spices]
            entity.vehicles = model.vehiclesArray?.map { createVehiclesEntityFrom($0, context: context) } as? [Vehicles]
            return entity
        }
        return nil
    }
    
    
    class func createStarshipsEntityFrom(_ model: StarshipModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Starships",
                                                                  into: context) as? Starships {
            return entity
        }
        return nil
    }
    
    
    class func createSpicesEntityFrom(_ model: SpicesModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Spices",
                                                                  into: context) as? Spices {
            return entity
        }
        return nil
    }
    
    
    class func createVehiclesEntityFrom(_ model: VehicleModel, context: NSManagedObjectContext) -> NSManagedObject? {
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "Vehicles",
                                                                  into: context) as? Vehicles {
            return entity
        }
        return nil
    }
        
}

//
//  DetailViewModel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation
import UIKit


enum DetailDisplayFields: String {
    case name, population, orbitalPeriod, rotationPeriod
    case climate, diameter, gravity, surfaceWater
    case terrain
    case films, residents
    case created, edited

    
    static func displayFieldType(_ key: String) -> (DetailDisplayFields?, String?, String?) {
        switch key {
        case "name": return (.name, "Name", String(describing: DetailRowViewCell.self))
        case "population": return (.population, "Average Population", String(describing: DetailRowViewCell.self))
        case "rotationPeriod": return (.rotationPeriod, "Rotation Period", String(describing: DetailRowViewCell.self))
        case "orbitalPeriod": return (.orbitalPeriod, "Orbital Period", String(describing: DetailRowViewCell.self))
        case "climate": return (.climate, "Climate", String(describing: DetailRowViewCell.self))
        case "diameter": return (.diameter, "Diameter", String(describing: DetailRowViewCell.self))
        case "gravity": return (.gravity, "Gravity", String(describing: DetailRowViewCell.self))
        case "surfaceWater": return (.surfaceWater, "Surface Water", String(describing: DetailRowViewCell.self))
        case "created": return (.created, "Created", String(describing: DetailRowViewCell.self))
        case "edited": return (.edited, "Edited", String(describing: DetailRowViewCell.self))
        case "terrain": return (.terrain, "Terrain", String(describing: DetailRowViewCell.self))
        case "films": return (.films, "Films", String(describing: DetailRowViewCell.self))
        case "residents": return (.residents, "Residents", String(describing: DetailRowViewCell.self))
        default: return (nil, nil, nil)
        }
    }
    
}

protocol DetailViewModelProtocol {
    var item: PlanetModel? { get set }
    var items: [[String: Any]]? { get }
    var starWarsItem: StarWars { get set }
}


class DetailViewModel: DetailViewModelProtocol {

    // MARK: - Input
    
    var starWarsItem: StarWars = .planets
    var item: PlanetModel?
    
    //MARK: Output
    
    var items: [[String: Any]]? {
        var i: [[String: Any]] = []
        item?.asDictionary.forEach {
            i.append([$0.key: $0.value])
        }
        return i
    }
    
}

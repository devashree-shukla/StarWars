//
//  DetailViewModel.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation
import UIKit

protocol DetailViewModelProtocol {
    var item: Planets? { get set }
    var fields: [(DetailDisplayFields, Any?)] { get }
    var items: [DetailDisplayFields] { get }
    var starWarsItem: StarWars { get set }
}

class DetailViewModel: DetailViewModelProtocol {

    // MARK: - Input
    var starWarsItem: StarWars = .planets
    var items: [DetailDisplayFields] {
        DetailDisplayFields.getDisplayFields(type: starWarsItem)
    }

    // MARK: Output
    var item: Planets?
    var fields: [(DetailDisplayFields, Any?)] {
        items.map { ($0, getValue(key: $0)) }
    }

     private func getValue(key: DetailDisplayFields) -> Any? {
        switch starWarsItem {
        case .planets:
            return getValuesForPlanets(key: key)
        case .people:
            return nil
        case .films:
            return nil
        case .starships, .spices, .vehicles:
            return nil
        }
    }

    // swiftlint:disable:next cyclomatic_complexity
    private func getValuesForPlanets(key: DetailDisplayFields) -> Any? {
        switch key {
        case .name:
            return item?.name
        case .population:
            return item?.population
        case .orbitalPeriod:
            return item?.orbitalPeriod
        case .rotationPeriod:
            return item?.rotationPeriod
        case .climate:
            return item?.climate
        case .diameter:
            return item?.diameter
        case .gravity:
            return item?.gravity
        case .surfaceWater:
            return item?.surfaceWater
        case .terrain:
            return item?.terrain
        case .films:

            return ""
//            return item?.films
        case .residents:
//            print(PlanetsNSSecureCoding(coder: item?.people))
            return item
        case .created:
            return item?.created
        case .edited:
            return item?.edited
        }
    }

}

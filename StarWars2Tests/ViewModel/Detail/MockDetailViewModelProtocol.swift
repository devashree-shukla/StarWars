//
//  MockDetailViewModelProtocol.swift
//  StarWars2Tests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
@testable import StarWars2
import XCTest

class MockDetailViewModelProtocol: DetailViewModelProtocol {
    var item: Planets?

    var fields: [(DetailDisplayFields, Any?)] {
        items.map { ($0, getValue(key: $0)) }
    }

    var items: [DetailDisplayFields] {
        DetailDisplayFields.getDisplayFields(type: starWarsItem)
    }

    var starWarsItem: StarWars = .planets

    func getValue(key: DetailDisplayFields) -> Any? {
        switch starWarsItem {
        case .planets:
            return getValuesForPlanets(key: key)
        default:
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

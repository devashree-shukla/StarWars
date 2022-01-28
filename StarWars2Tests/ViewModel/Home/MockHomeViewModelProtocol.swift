//
//  MockHomeViewModelProtocol.swift
//  StarWars2Tests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
@testable import StarWars2
import XCTest

class MockHomeViewModelProtocol: HomeViewModelProtocol {
    func selectedItem(index: Int) -> StarWars {
        XCTAssert(index < StarWars.allCases.count)
        XCTAssertNotNil(index)
        return StarWars.allCases[index]
    }

    var starWarsItems: [StarWars] = StarWars.allCases
}

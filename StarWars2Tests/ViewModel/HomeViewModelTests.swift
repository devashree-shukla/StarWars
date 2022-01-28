//
//  HomeViewModelTests.swift
//  StarWars2Tests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
@testable import StarWars2
import XCTest

class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!

    override func setUp() {
        viewModel = HomeViewModel()
    }

    func testHomeViewModelShouldNotBeNil() {
        XCTAssertNotNil(viewModel, "Home view model should not be nil")
    }
    
    func testStarWarsItemsShouldNotBeNil() {
        XCTAssertNotNil(viewModel.starWarsItems, "Star wars items should not be empty")
    }
    
    func testStarWarsItemsCountShouldBeSix() {
        XCTAssertEqual(viewModel.starWarsItems.count, 6)
    }
    
    func testStarWarsArrayShouldReturnNotNil() {
        let index = Int.random(in: 0..<5)
        if viewModel.starWarsItems.count < index {
            XCTAssertNotNil(viewModel.starWarsItems[index])
        }
    }
    
    func testStarWarsArrayShouldReturnNotNilDescription() {
        let index = Int.random(in: 0..<5)
        if viewModel.starWarsItems.count < index {
            XCTAssertNotNil(viewModel.starWarsItems[index].description, "Description should not be nil")
        }
    }
    
    func testStarWarsArrayShouldReturnNotNilDescriptionForPlanet() {
        XCTAssertNotNil(viewModel.selectedItem(index: 0).description == StarWars.planets.description,
                        "Should return description for planets")
    }
    
    func testStarWarsViewModelShouldReturnSelectedItem() {
        let index = Int.random(in: 0..<5)
        if viewModel.starWarsItems.count < index {
            XCTAssertNotNil(viewModel.selectedItem(index: index), "Should return not nill selected item")
        }
    }

}

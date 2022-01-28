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
    var viewModelProtocol: MockHomeViewModelProtocol!

    override func setUp() {
        viewModel = HomeViewModel()
        viewModelProtocol = MockHomeViewModelProtocol()
    }

    func testHomeViewModelShouldNotBeNil() {
        XCTAssertNotNil(viewModel, "Home view model should not be nil")
    }

    func testHomeViewModelProtocolShouldNotBeNil() {
        XCTAssertNotNil(viewModelProtocol, "Home view model protocol should not be nil")
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

    func testHomeViewModelStarWarsItemShouldBeChangeable() {
        XCTAssertTrue(viewModel.selectedItem(index: 0) == .planets, "ListViewModel have selected planets type")
        XCTAssertTrue(viewModel.selectedItem(index: 1) == .people, "ListViewModel have selected people type")
    }

    func testHomeViewModelProtocolShouldReturnStarWarsItem() {
        XCTAssertTrue(viewModelProtocol.selectedItem(index: 0) == .planets, "ListViewModel have selected planets type")
        XCTAssertTrue(viewModelProtocol.selectedItem(index: 1) == .people, "ListViewModel have selected people type")
    }

    func testHomeViewModelProtocolShouldReturnForPlanet() {
        XCTAssertNotNil(viewModelProtocol.selectedItem(index: 0).description == StarWars.planets.description,
                        "Should return description for planets")
        XCTAssertNotNil(viewModelProtocol.selectedItem(index: 0).description, "Description should not be nil")
    }

}

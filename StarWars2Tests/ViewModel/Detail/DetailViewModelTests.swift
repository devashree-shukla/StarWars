//
//  DetailViewModelTests.swift
//  StarWars2Tests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
@testable import StarWars2
import XCTest

class DetailViewModelTests: XCTestCase {
    var viewModel: DetailViewModel!
    var viewModelProtocol: MockDetailViewModelProtocol!

    override func setUp() {
        viewModel = DetailViewModel()
        viewModelProtocol = MockDetailViewModelProtocol()
    }

    func testDetailViewModelShouldNotBeNil() {
        XCTAssertNotNil(viewModel, "Detail view model should not be nil")
    }
    
    func testDetailViewModelProtocolShouldNotBeNil() {
        XCTAssertNotNil(viewModelProtocol, "Detail view model protocol should not be nil")
    }
    
    func testDetailViewModelItemsShouldNotBeNil() {
        XCTAssertNotNil(viewModel.starWarsItem, "DetailViewModel items should not be empty")
    }
    
    func testDefaultDetailViewModelShouldBePlanets() {
        XCTAssertNotNil(viewModel.starWarsItem == .planets, "SDetailViewModel items should be palnets by default")
    }
    
    func testDetailViewModelItemsForDetailsShouldNotBeNil() {
        XCTAssertNotNil(viewModel.items, "Displayfields Items should have some values to display")
    }
    
    func testDetailViewModelItemsForDetailsForPlanets() {
        XCTAssertEqual(viewModel.items.count, DetailDisplayFields.getDisplayFields(type: .planets).count, "Displayfields Items should have some values to display for planets")
        XCTAssertEqual(viewModel.items.count, 13, "Displayfields Items should have 13 to display for planets")
    }
    
    func testDetailViewModelSelectedItemShouldNotBeNil() {
        let planet = Planets()
        viewModel.item = planet
        XCTAssertNotNil(viewModel.item, "Items should not be empty")
    }
    
    func testDetailViewModelTitleValueShouldNotBeNil() {
        XCTAssertNotNil(viewModel.fields, "Fields should not be empty")
    }
    
    func testDetailViewModelTitlesShouldNotBeNil() {
        viewModel.fields.forEach {
            XCTAssertNotNil($0.0, "Fields titles should not be empty")
        }
    }
    
    func testListViewModelStarWarsItemShouldNotBeChangeable() {
        XCTAssertTrue(viewModel.starWarsItem == .planets, "ListViewModel have planets type")
        XCTAssertFalse(
            viewModel.starWarsItem == .people,
            "ListViewModel should not be changed from detail view - It gets value from List view controller only")
        XCTAssertTrue(viewModel.starWarsItem == .planets, "ListViewModel don't have planets type now")
    }
    
    func testDetailViewModelProtocolTitleValueShouldNotBeNil() {
        XCTAssertNotNil(viewModelProtocol.fields, "Fields should not be empty")
    }
    
    func testDetailViewModelProtocolTitlesShouldNotBeNil() {
        viewModelProtocol.fields.forEach {
            XCTAssertNotNil($0.0, "Fields titles should not be empty")
        }
    }
    
    func testListViewModelProtocolStarWarsItemShouldNotBeChangeable() {
        XCTAssertTrue(viewModelProtocol.starWarsItem == .planets, "ListViewModel have planets type")
        XCTAssertFalse(
            viewModelProtocol.starWarsItem == .people,
            "ListViewModel should not be changed from detail view - It gets value from List view controller only")
        XCTAssertTrue(viewModelProtocol.starWarsItem == .planets, "ListViewModel don't have planets type now")
    }
    
    // TODO: Need to update this once core data save-retrive issue gets fixed
//    func testDetailViewModelSelectedItemPeopleShouldBeFilmsNSSecureCoding() {
//        let planet = Planets()
//        viewModel.item = planet
//        XCTAssertNotNil(viewModel.item, "Items should not be empty")
//        planet.people?.peopleList = [Residents(), Residents()]
//        viewModel.item = planet
//
//        XCTAssertNotNil(viewModel.item?.films as? FilmsNSSecureCoding, "Items should not be empty")
//    }

}

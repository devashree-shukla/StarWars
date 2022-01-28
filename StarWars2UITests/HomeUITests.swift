//
//  HomeUITests.swift
//  StarWars2UITests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
import XCTest

// MARK: - Home table view

class HomePageTest: StarWars2UITests {

    func testIfScreenContainsTable() {
        let homeTable = application.tables
        let table = homeTable.element
        XCTAssertTrue(table.exists)
    }

    func testIfHomeTableViewAppears() {
        let homeTable = application.tables
        let initialTableRows = homeTable.children(matching: .cell).count
        XCTAssert(initialTableRows == 6)
    }

    func testIfHomeTableViewScrollable() {
        let homeTable = application.tables
        homeTable.element.swipeUp()
        homeTable.element.swipeDown()
        homeTable.element.swipeUp()
        homeTable.element.swipeDown()
    }

}

// MARK: - Home table rows

extension HomePageTest {

    func testIfHomeTableHasAllSixRows() {
        let homeTable = application.tables
        for index in 0..<6 {
            let cell = homeTable.cells.element(boundBy: index)
            XCTAssertTrue(cell.exists)
        }
    }

    func testIfHomeTableHaveFirstPlanetsRow() {
        let homeTable = application.tables
        let cell = homeTable.cells.element(boundBy: 0)
        let indexedText = cell.staticTexts["Planets"]
        XCTAssertTrue(indexedText.exists)
    }

    func testIfHomeTableHaveSecondPeopleRow() {
        let homeTable = application.tables
        let cell = homeTable.cells.element(boundBy: 1)
        let indexedText = cell.staticTexts["People"]
        XCTAssertTrue(indexedText.exists)
    }

    func testIfHomeTableHaveThirdFilmsRow() {
        let homeTable = application.tables
        let cell = homeTable.cells.element(boundBy: 2)
        let indexedText = cell.staticTexts["Films"]
        XCTAssertTrue(indexedText.exists)
    }

    func testIfHomeTableHaveForthStarshipsRow() {
        let homeTable = application.tables
        let cell = homeTable.cells.element(boundBy: 3)
        let indexedText = cell.staticTexts["Starships"]
        XCTAssertTrue(indexedText.exists)
    }

    func testIfHomeTableHaveFifthSpicesRow() {
        let homeTable = application.tables
        let cell = homeTable.cells.element(boundBy: 4)
        let indexedText = cell.staticTexts["Spices"]
        XCTAssertTrue(indexedText.exists)
    }

    func testIfHomeTableHaveSixthVehiclesRow() {
        let homeTable = application.tables
        let cell = homeTable.cells.element(boundBy: 5)
        let indexedText = cell.staticTexts["Vehicles"]
        XCTAssertTrue(indexedText.exists)
    }

    func testIfAllRowsAreTabppable() {
        let homeTable = application.tables
        for index in 0..<6 {
            let cell = homeTable.cells.element(boundBy: index)
            cell.tapOnUIElement()
        }
    }

}

// MARK: - Home Navigation bar

extension HomePageTest {

    func testIfNavigationTitleAsStarWarsExists() {
        XCTAssert(application.staticTexts["Star Wars"].exists)

        let navigationBar = application.navigationBars["Star Wars"].staticTexts["Star Wars"]
        XCTAssert(navigationBar.exists)

        XCTAssert(application.staticTexts.matching(identifier: "Star Wars").count != 0)

    }

}

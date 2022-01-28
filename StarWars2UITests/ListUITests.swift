//
//  ListUITest.swift
//  StarWars2UITests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
import XCTest

//MARK: - List table view

class ListPageTest: StarWars2UITests {
    
    override func setUp() {
        super.setUp()
        let homeTable = application.tables
        let cell = homeTable.cells.element(boundBy: 0)
        cell.tap()
    }

    func testIfScreenContainsTable() {
        let listTable = application.tables
        let table = listTable.element
        XCTAssertTrue(table.exists)
    }
    
    func testIfListTableViewAppearsAndHaveTenRows() {
        let listTable = application.tables
        let initialTableRows = listTable.children(matching: .cell).count
        XCTAssert(initialTableRows == 10)
    }
    
    func testIfListTableViewScrollable() {
        let listTable = application.tables
        listTable.element.swipeUp()
        listTable.element.swipeDown()
        listTable.element.swipeUp()
        listTable.element.swipeDown()
    }
    
}

//MARK: - List table rows

extension ListPageTest {
    
    func testIfListTableHasTenRows() {
        let listTable = application.tables
        for i in 0..<9 {
            let cell = listTable.cells.element(boundBy: i)
            XCTAssertTrue(cell.exists)
        }
    }
    
    func testIfListTableHaveRowHaveTitleLabels() {
        let listTable = application.tables
        for i in 0..<9 {
            let initialTableRows = listTable.children(matching: .cell).element(boundBy: i)
            let indexedText = initialTableRows.staticTexts["PLANET \(i + 1)"].label
            XCTAssertTrue(indexedText == "PLANET \(i + 1)")
        }
    }
    
    func testIfListTableHaveRowHaveDescriptionLabels() {
        let listTable = application.tables
        for i in 0..<9 {
            let initialTableRows = listTable.children(matching: .cell).element(boundBy: i)
            let indexedText = initialTableRows.staticTexts.element(boundBy: 1).label
            XCTAssertTrue(!indexedText.isEmpty)
        }
    }
    
    func testIfListTableHaveRowHaveDetailLabels() {
        let listTable = application.tables
        for i in 0..<9 {
            let initialTableRows = listTable.children(matching: .cell).element(boundBy: i)
            let indexedText = initialTableRows.staticTexts.element(boundBy: 2).label
            XCTAssertTrue(!indexedText.isEmpty)
        }
    }
    
    func testIfListTableHaveRowShoulldHaveSurfaceWaterPercentageLabels() {
        let listTable = application.tables
        for i in 0..<9 {
            let initialTableRows = listTable.children(matching: .cell).element(boundBy: i)
            let indexedText = initialTableRows.staticTexts.element(matching: .staticText, identifier: "description").label
            XCTAssertTrue(!indexedText.isEmpty)
            XCTAssertTrue(indexedText.contains("%"))
        }
    }
    
    func testIfAllRowsAreTabppable() {
        let listTable = application.tables
        for i in 0..<6 {
            let cell = listTable.cells.element(boundBy: i)
            cell.tap()
        }
    }

}

//MARK: - List Navigation bar

extension ListPageTest {
    
    func testIfNavigationBarExists() {
        let predicate = NSPredicate(format: "identifier CONTAINS 'Planets('")
        let nav = application.navigationBars.matching(predicate).element(boundBy: 0)
        XCTAssert(nav.exists)
    }
    
    func testIfBackButtonExists() {
        let backButton = application.buttons["Star Wars"]
        XCTAssert(backButton.exists)
    }
    
    func testIfBackNavigatable() {
        let backButton = application.buttons["Star Wars"]
        backButton.tap()
    }
    
}



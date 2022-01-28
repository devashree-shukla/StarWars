//
//  DetailUITest.swift
//  StarWars2UITests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
import XCTest

// MARK: - Detail table view

class DetailPageTest: StarWars2UITests {

    override func setUp() {
        super.setUp()
        HomePageTest.setUp()
        ListPageTest.setUp()
        let detailTable = application.tables
        let cell = detailTable.cells.element(boundBy: 0)
        cell.tap()
    }

    func testIfScreenContainsTable() {
        let listTable = application.tables
        let table = listTable.element
        XCTAssertTrue(table.exists)
    }

    func testIfListTableViewAppearsAndHaveSomeRows() {
        let listTable = application.tables
        let initialTableRows = listTable.children(matching: .cell).count
        XCTAssert(initialTableRows != 0)
    }

    func testIfListTableViewScrollable() {
        let listTable = application.tables
        listTable.element.swipeUp()
        listTable.element.swipeDown()
        listTable.element.swipeUp()
        listTable.element.swipeDown()
    }

}

// MARK: - Detail table rows

extension DetailPageTest {

    func testIfListTableHaveRowHaveTitleLabels() {
        let listTable = application.tables
        for index in 0..<9 {
            let initialTableRows = listTable.children(matching: .cell).element(boundBy: index)
            let indexedText = initialTableRows.staticTexts
            XCTAssertTrue(indexedText.element.exists)
        }
    }

    func testIfListTableHaveRowHaveValueLabels() {
        let listTable = application.tables
        for _ in 0..<9 {
            let initialTableRows = listTable.children(matching: .cell).count
            XCTAssertTrue(initialTableRows > 1)
        }
    }

    func testIfAllRowsAreTabppable() {
        let listTable = application.tables
        for index in 0..<6 {
            let cell = listTable.cells.element(boundBy: index)
            cell.tap()
        }
    }

}

// MARK: - Detail fields

extension DetailPageTest {

    func testIfListTableHaveRowShoulldHaveSurfaceWaterPercentageLabels() {
        let detailTable = application.tables
        let cell = detailTable.cells.element(boundBy: 0)
        cell.tap()
        let predicate = NSPredicate(format: "label CONTAINS '%'")
        let item = application.tables.staticTexts.matching(predicate).element(boundBy: 0)
        XCTAssert(item.exists)
    }

    func testIfListTableHaveRowShoulldHaveHoursLabels() {
        let detailTable = application.tables
        let cell = detailTable.cells.element(boundBy: 0)
        cell.tap()
        let predicate = NSPredicate(format: "label CONTAINS '(HOURS)'")
        let item = application.tables.staticTexts.matching(predicate).element(boundBy: 0)
        XCTAssert(item.exists)
    }

    func testIfListTableHaveRowShoulldHaveDaysLabels() {
        let detailTable = application.tables
        let cell = detailTable.cells.element(boundBy: 0)
        cell.tap()
        let predicate = NSPredicate(format: "label CONTAINS '(DAYS)'")
        let item = application.tables.staticTexts.matching(predicate).element(boundBy: 0)
        XCTAssert(item.exists)
    }

    func testIfListTableHaveRowShoulldHaveGravityLabels() {
        let detailTable = application.tables
        let cell = detailTable.cells.element(boundBy: 0)
        cell.tap()
        let predicate = NSPredicate(format: "label CONTAINS '(G)'")
        let item = application.tables.staticTexts.matching(predicate).element(boundBy: 0)
        XCTAssert(item.exists)
    }

    func testIfListTableHaveRowShoulldHaveDiametersLabels() {
        let detailTable = application.tables
        let cell = detailTable.cells.element(boundBy: 0)
        cell.tap()
        let predicate = NSPredicate(format: "label CONTAINS '(KM)'")
        let item = application.tables.staticTexts.matching(predicate).element(boundBy: 0)
        XCTAssert(item.exists)
    }

}

// MARK: - Detail Navigation bar

extension DetailPageTest {

    func testIfNavigationBarExists() {
        let predicate = NSPredicate(format: "identifier CONTAINS 'Planets('")
        let nav = application.navigationBars.matching(predicate).element(boundBy: 0)
        XCTAssert(nav.exists)
    }

    func testIfBackNavigatable() {
        let backButton = application.buttons["Star Wars"]
        backButton.tapOnUIElement()
    }

}

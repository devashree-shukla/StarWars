//
//  StarWars2UITests.swift
//  StarWars2UITests
//
//  Created by Devashree KS on 23/01/22.
//

import XCTest

class StarWars2UITests: XCTestCase {

    let application = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        launchApp()
    }

    func launchApp() {
        application.launch()
    }

    func relaunchApp() {
        application.terminate()
        application.activate()
    }

    override func tearDown() {
        print(XCUIApplication.debugDescription())
        application.terminate()
        super.tearDown()
    }
}

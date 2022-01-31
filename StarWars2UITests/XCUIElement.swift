//
//  XXCUIElement.swift
//  StarWars2UITests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
import XCTest

extension XCUIElement {

    // MARK: - Actions

    func tapOnUIElement() {
        waitForElementToAppear()
        tap()
    }

    // MARK: - Validations

    func waitForElementToAppear(_ description: String? = nil, timeout: TimeInterval = 10.0) {
        let predicate = NSPredicate(format: "exists == true")
        let hasAppeared = XCTNSPredicateExpectation(predicate: predicate, object: self)
        _ = XCTWaiter.wait(for: [hasAppeared], timeout: timeout)
    }

    func assertExists() {
        XCTAssert(self.exists)
    }
}

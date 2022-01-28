//
//  ListViewModelTests.swift
//  StarWars2Tests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
@testable import StarWars2
import XCTest

class ListViewModelTests: XCTestCase {
    var viewModel: ListViewModel!
    var viewModelProtocol: MockListViewModelProtocol!

    override func setUp() {
        viewModel = ListViewModel()
        viewModelProtocol = MockListViewModelProtocol()
    }

    func testListViewModelShouldNotBeNil() {
        XCTAssertNotNil(viewModel, "List view model should not be nil")
    }
    
    func testListViewModelProtocolShouldNotBeNil() {
        XCTAssertNotNil(viewModelProtocol, "List view model should not be nil")
    }

    func testListViewModelStarWarsItemsShouldNotBeNil() {
        XCTAssertNotNil(viewModel.starWarsItem, "Star wars items should not be empty")
    }
    
    func testDefaultListViewModelShouldBePlanets() {
        XCTAssertNotNil(viewModel.starWarsItem == .planets, "ListViewModel items should be palnets by default")
    }
    
    func testListViewModelStarWarsItemShouldBeChangeable() {
        XCTAssertTrue(viewModel.starWarsItem == .planets, "ListViewModel have planets type")
        viewModel.starWarsItem = .people
        XCTAssertTrue(viewModel.starWarsItem == .people, "ListViewModel have people type")
        XCTAssertFalse(viewModel.starWarsItem == .planets, "ListViewModel don't have planets type now")
    }
    
    func testDefaultNavigationTitleValueWhenNoDataFetched() {
        XCTAssert(viewModel.planetFromCoreData.count == 0, "Planet data have no items")
        XCTAssertEqual(viewModel.navigationTitle, "Loading...")
        XCTAssert(viewModel.planetFromCoreData.count == 0, "Planet data have no items")
        viewModel.data = []
        viewModel.planetFromCoreData = []
        XCTAssertEqual(viewModel.navigationTitle, "Loading...")
    }
    
    func testNavigationTitleValueAfterDataFetched() {
        XCTAssert(viewModel.planetFromCoreData.count == 0, "Planet data have no items")
        XCTAssertEqual(viewModel.navigationTitle, "Loading...")
        XCTAssert(viewModel.planetFromCoreData.count == 0, "Planet data have no items")
        viewModel.planetFromCoreData = [Planets()]
        XCTAssertFalse(viewModel.navigationTitle == "Loading...")
        XCTAssertFalse(viewModel.navigationTitle == "\(viewModel.starWarsItem.description) + \(viewModel.planetFromCoreData.count) records)")
    }
    
    func testNavigationTitleValueAfterDataFetchedFail() {
        XCTAssert(viewModel.planetFromCoreData.count == 0, "Planet data have no items")
        XCTAssertEqual(viewModel.navigationTitle, "Loading...")
        XCTAssert(viewModel.planetFromCoreData.count == 0, "Planet data have no items")
        viewModel.planetFromCoreData = [Planets()]
        XCTAssertFalse(viewModel.navigationTitle == "Loading...")
        XCTAssert(viewModel.navigationTitle == "\(viewModel.starWarsItem.description)(\(viewModel.planetFromCoreData.count) records)")
        viewModel.planetFromCoreData = []
        XCTAssertFalse(viewModel.navigationTitle == "\(viewModel.starWarsItem.description)(\(viewModel.planetFromCoreData.count) records)")
        XCTAssertTrue(viewModel.navigationTitle == "Loading...")
        viewModel.data = [PlanetModel(name: "", population: "", films: [], residents: [], created: "", edited: "", climate: "", diameter: "", gravity: "", surfaceWater: "", orbitalPeriod: "", rotationPeriod: "", terrain: "", filmArray: [], residentArray: [])]
        viewModel.planetFromCoreData = []
        XCTAssertFalse(viewModel.navigationTitle == "Loading...")
        XCTAssertTrue(viewModel.navigationTitle == "\(viewModel.starWarsItem.description)(\(viewModel.data.count) records)")
    }
    
    func testListViewModelShouldBeSelectable() {
        viewModel.planetFromCoreData.first?.name = "Test Name"
        if viewModel.planetFromCoreData.count > 0 {
            viewModel.selectItem(index: 0) {
                XCTAssertNotNil($0?.name, "Selected list item name field should not be nil")
            }
        }
    }
    
    func testListViewModelFetchDataAPI() {
        viewModel.fetchData { result in
            
        }
    }
    
}

extension ListViewModelTests {
    
    func testLinkViewModelAPIForNoNetworkError() {
        let expect = expectation(description: "Wait for network call")
        viewModelProtocol.planetFromCoreData = []
        viewModelProtocol.createMockData(data: Data(),
                                         response: nil,
                                         error: ErrorResult.network(string: "No network error"))
        viewModelProtocol.fetchData { result in
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            XCTAssertTrue(self.viewModelProtocol.planetFromCoreData.isEmpty, "No network error")
            expect.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testLinkViewModelAPIForSuccessResponse() {
        let expect = expectation(description: "Wait for network call")
        viewModelProtocol.planetFromCoreData = []
        viewModelProtocol.fetchData { _ in }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            XCTAssertNotNil(self.viewModelProtocol.planetFromCoreData, "Should fetch some data")
            expect.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testLinkViewModelAPIForNoRecordsInResponse() {
        let expect = expectation(description: "Wait for network call")
        viewModelProtocol.planetFromCoreData = []
        viewModelProtocol.createMockData(data: MockReesponse.noRecords.mockedResponse)
        viewModelProtocol.fetchData { _ in }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            XCTAssert(self.viewModelProtocol.planetFromCoreData.count == 0,
                      "Should fetch some data, some issue in received response")
            if let item = MockReesponse.noRecords.serializedResponse as? [String: Any] {
                if let count = item["count"] as? Int {
                    XCTAssert(count == 0)
                }
                if let result = item["results"] as? [Any] {
                    XCTAssertFalse(result.count == 0)
                }
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testLinkViewModelAPIForFirstPageResponse() {
        let expect = expectation(description: "Wait for network call")
        viewModelProtocol.planetFromCoreData = []
        viewModelProtocol.createMockData(data: MockReesponse.firstPageResponse.mockedResponse)
        viewModelProtocol.fetchData { _ in }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            if let item = MockReesponse.firstPageResponse.serializedResponse as? [String: Any] {
                if let count = item["count"] as? Int {
                    XCTAssert(count == 60)
                }
                if let r = item["results"] as? [String: Any] {
                    XCTAssert(r.count == 10)
                }
                if let previous = item["previous"] as? String {
                    XCTAssertNil(previous)
                }
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testLinkViewModelAPIForMidPageResponse() {
        let expect = expectation(description: "Wait for network call")
        viewModelProtocol.planetFromCoreData = []
        viewModelProtocol.createMockData(data: MockReesponse.midPageResponse.mockedResponse)
        viewModelProtocol.fetchData { _ in }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            if let item = MockReesponse.midPageResponse.serializedResponse as? [String: Any] {
                if let count = item["count"] as? Int {
                    XCTAssert(count == 60)
                }
                if let r = item["results"] as? [String: Any] {
                    XCTAssert(r.count == 10)
                }
                if let previous = item["previous"] as? String {
                    XCTAssertNil(previous)
                }
                if let previous = item["next"] as? String {
                    XCTAssertNil(previous)
                }
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testLinkViewModelAPIForLastPageResponse() {
        let expect = expectation(description: "Wait for network call")
        viewModelProtocol.planetFromCoreData = []
        viewModelProtocol.createMockData(data: MockReesponse.lastPageResponse.mockedResponse)
        viewModelProtocol.fetchData { _ in }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            if let item = MockReesponse.lastPageResponse.serializedResponse as? [String: Any] {
                if let count = item["count"] as? Int {
                    XCTAssert(count == 60)
                }
                if let r = item["results"] as? [String: Any] {
                    XCTAssert(r.count == 10)
                }
                if let previous = item["previous"] as? String {
                    XCTAssertNil(previous)
                }
                if let previous = item["next"] as? String {
                    XCTAssertNil(previous)
                }
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
}

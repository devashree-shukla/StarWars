//
//  NetworkLayerTests.swift
//  StarWars2Tests
//
//  Created by Devashree KS on 28/01/22.
//

import XCTest
@testable import StarWars2

struct Course: Codable {
    var identifier: Int
    var name: String
    var link: String
    var numberOfLessions: Int

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case link
        case numberOfLessions = "number_of_lessons"
    }
}

class NetworkLayerUnitTests: XCTestCase {

    var url: URL!

    override func setUp() {
        url = URL(fileURLWithPath: "url")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testForSuccessFulResponse() {
        let jsonString = """
        {
        "id":1,
        "name":"InstagramFirebase",
        "link":"https://www.letsbuildthatapp.com/course/instagram-firebase",
        "number_of_lessons":49
        }
        """
        let jsonData = Data(jsonString.utf8)
        let expect = expectation(description: "Wait for network call")
        MockURLSession.data = jsonData
        MockURLSession.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        MockURLSession.error = nil

        let reqID = TabbarDataManager.fetchSampleAPI(isMocking: true) { (result) in
            switch result {

            case .success(let apiResponse):
                let course = apiResponse.data
                XCTAssertNotNil(course, "Parsed data should not be empty")
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
            expect.fulfill()
        }
        XCTAssert(reqID != nil, "DataTask Id is not present")
        waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

    func testForDecodingError() {
        let jsonString = """
        [
           {
           "name": "Benedict",
           "age": 26
           },
          {
            "name": "John",
            "age": 25
          }
        ]
        """
        let jsonData = Data(jsonString.utf8)
        MockURLSession.data = jsonData
        MockURLSession.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        MockURLSession.error = nil

        let expect = expectation(description: "Wait for network call")
        let reqID = TabbarDataManager.fetchSampleAPI(isMocking: true) { (result) in
            switch result {

            case .success:
                XCTAssert(false, "Parsed data should be Nil")
            case .failure(let error):
                switch error {
                case .parsingError:
                    XCTAssert(true, error.localizedDescription)
                default:
                    XCTAssert(false, error.localizedDescription)
                }
            }
            expect.fulfill()
        }
        XCTAssert(reqID != nil, "DataTask Id is not present")
        waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

    func testForInvalidDataError() {
        MockURLSession.data = nil
        MockURLSession.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        MockURLSession.error = nil

        let expect = expectation(description: "Wait for network call")
        let reqID = TabbarDataManager.fetchSampleAPI(isMocking: true) { (result) in
            switch result {

            case .success:
                XCTAssert(false, "Success Response must not have occured")
            case .failure(let error):
                switch error {
                case .invalidResponse:
                    XCTAssert(true, error.localizedDescription)
                default:
                    XCTAssert(false, error.localizedDescription)
                }
            }
            expect.fulfill()
        }
        XCTAssert(reqID != nil, "DataTask Id is not present")
        waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

    func testForServerError() {
        MockURLSession.data = nil
        MockURLSession.response = nil
        MockURLSession.error = APIError.invalidRequest
        let expect = expectation(description: "Wait for network call")
        let reqID = TabbarDataManager.fetchSampleAPI(isMocking: true) { (result) in
            switch result {

            case .success:
                XCTAssert(false, "Success Response must not have occured")
            case .failure(let error):
                switch error {
                case .generalError:
                    XCTAssert(true, error.localizedDescription)
                default:
                    XCTAssert(false, error.localizedDescription)
                }
            }
            expect.fulfill()
        }
        XCTAssert(reqID != nil, "DataTask Id is not present")
        waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}

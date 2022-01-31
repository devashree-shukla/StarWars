//
//  MockURLSession.swift
//  StarWars2Tests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation

class MockURLSession: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    static var data: Data?
    static var error: Error?
    static var response: HTTPURLResponse?

    override func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
        ) -> URLSessionDataTask {
        let data = MockURLSession.data
        let error = MockURLSession.error
        let response = MockURLSession.response

        return MockURLSessionDataTask {
            completionHandler(data, response, error)
        }
    }

    override func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let data = MockURLSession.data
        let error = MockURLSession.error
        let response = MockURLSession.response

        return MockURLSessionDataTask {
            completionHandler(data, response, error)
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}

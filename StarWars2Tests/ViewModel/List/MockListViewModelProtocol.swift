//
//  ListViewModelProtocolTests.swift
//  StarWars2Tests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
@testable import StarWars2
import XCTest

class MockListViewModelProtocol: ListViewModelProtocol {
   
    func fetchData(_ completion: ((Result<Bool, ErrorResult>) -> Void)?) {
        
    }
    
    func selectItem(index: Int, _ completion: ((Planets?) -> Void)?) {
        
    }
    
    var onErrorHandling: ((ErrorResult?) -> Void)?
    
    var starWarsItem: StarWars = .planets
    
    var navigationTitle: String?
    
    var planetFromCoreData: [Planets] = []
    
    var selectedItem: Planets?
    
    func createMockData(data: Data? = nil,
                        response: HTTPURLResponse? = nil,
                        error: Error? = nil) {
        MockURLSession.data = data
        guard let url = URL(string: "https://swapi.dev/api/planets/") else {
            return
        }
        MockURLSession.response = response ?? HTTPURLResponse(url: url, statusCode: 200,
                                                  httpVersion: nil, headerFields: nil)
        MockURLSession.error = error
    }
    
}

//
//  HomeViewModel.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import Foundation

protocol HomeViewModelProtocol {
    func selectedItem(index: Int) -> StarWars
    var starWarsItems: [StarWars] { get }
}

class HomeViewModel: HomeViewModelProtocol {

    // MARK: Input
    func selectedItem(index: Int) -> StarWars {
        StarWars.allCases[index]
    }

    // MARK: - Output
    var starWarsItems = StarWars.allCases

}

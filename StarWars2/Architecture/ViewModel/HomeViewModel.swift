//
//  HomeViewModel.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import Foundation


protocol HomeViewModelProtocol {
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set }
    func didSelectSegment(_ segmentIndex: Int)
    func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)?)
    var starWarsItems: [StarWars] { get }
}


class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Input
    
    //MARK: - Output
    var starWarsItems = StarWars.allCases
    var onErrorHandling: ((ErrorResult?) -> Void)?
    
    func didSelectSegment(_ segmentIndex: Int) {
        
    }
    
    func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)?) {
        
    }

}

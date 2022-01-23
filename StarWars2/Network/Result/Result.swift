//
//  Result.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation


enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}


//
//  ErrorResult.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

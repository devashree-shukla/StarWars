//
//  Parceable.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

protocol Parceable {
    static func parseObject(data: Data) -> Result<Self, ErrorResult>
}

protocol AsDictionaryConvertible {
    var asDictionary: [String: Any] { get }
}

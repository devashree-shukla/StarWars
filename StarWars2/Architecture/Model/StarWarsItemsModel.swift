//
//  StarWarsItems.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

//MARK: - Home screen root model

struct StarWarsItemsModel: Codable {
    let itemName: Int
    let itemValue: String
}


extension StarWarsItemsModel: Parceable {

    static func parseObject(data: Data) -> Result<StarWarsItemsModel, ErrorResult> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let result = try? decoder.decode(StarWarsItemsModel.self, from: data) {
            return Result.success(result)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse flickr results"))
        }
    }

}


//
//  Parceable.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation


final class ParserHelper {

    static func parse<T: Parceable>(data: Data, completion: (Result<[T], ErrorResult>) -> Void) {
        switch T.parseObject(data: data) {
        case .failure(let error):
            completion(.failure(error))
        case .success(let newModel):
            completion(.success([newModel]))
        }
    }

    
    static func parse<T: Parceable>(data: Data, completion: (Result<T, ErrorResult>) -> Void) {
        switch T.parseObject(data: data) {
        case .failure(let error):
            completion(.failure(error))
        case .success(let newModel):
            completion(.success(newModel))
        }
    }
}


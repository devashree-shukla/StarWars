//
//  People.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation

protocol RouterProtocol {
    func fetchConverter(_ completion: @escaping ((Result<BaseModel, ErrorResult>) -> Void))
    func fetchPeople(_ completion: @escaping ((Result<PeopleModel, ErrorResult>) -> Void))
    func fetchFilm(_ completion: @escaping ((Result<FilmModel, ErrorResult>) -> Void))
}

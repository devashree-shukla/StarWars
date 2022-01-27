//
//  StarshipsNSSecureCoding.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation

@objc(StarshipsNSSecureCoding)
public class StarshipsNSSecureCoding: NSObject, NSSecureCoding {

    public static var supportsSecureCoding: Bool = true

    var charactersList: [Residents]?
    var filmsList: [Films]?

    required init(charactersList: [Residents]?, filmsList: [Films]?) {
        self.charactersList = charactersList
        self.filmsList = filmsList
    }

    public func encode(with coder: NSCoder) {
        coder.encode(charactersList, forKey: "pilots")
        coder.encode(filmsList, forKey: "films")
    }

    required public init?(coder: NSCoder) {
        charactersList = coder.decodeObject(of: NSArray.self, forKey: "pilots") as? [Residents] ?? []
        filmsList = coder.decodeObject(of: NSArray.self, forKey: "films") as? [Films] ?? []
    }

}

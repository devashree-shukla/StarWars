//
//  PlanetsNSSecureCoding.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation

@objc(PlanetsNSSecureCoding)
public class PlanetsNSSecureCoding: NSObject, NSSecureCoding {

    public static var supportsSecureCoding: Bool = true

    var planetsList: [Planets]?

    required init(planetsList: [Planets]?) {
        self.planetsList = planetsList
    }

    public func encode(with coder: NSCoder) {
        coder.encode(planetsList, forKey: "planets")
    }

    required public init?(coder: NSCoder) {
        planetsList = coder.decodeObject(of: NSArray.self, forKey: "planets") as? [Planets] ?? []
    }

}

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
    
    var peopleList: [Residents]?
//    var filmList: [Films]?
    
    required init(questions: [Residents]?, films: [Films]?) {
        self.peopleList = questions
//        self.filmList = films
    }
    
    
    public func encode(with coder: NSCoder) {
        coder.encode(peopleList, forKey: "residents")
//        coder.encode(filmList, forKey: "films")

    }
    
    
    required public init?(coder: NSCoder) {
        peopleList = coder.decodeObject(of: NSArray.self, forKey: "residents") as? Array<Residents> ?? []
//        filmList = coder.decodeObject(of: NSArray.self, forKey: "films") as? Array<Films> ?? []
    }
}


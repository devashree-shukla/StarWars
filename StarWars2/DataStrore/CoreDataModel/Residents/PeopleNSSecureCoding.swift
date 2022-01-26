//
//  s.swift
//  StarWars2
//
//  Created by Devashree KS on 26/01/22.
//

import Foundation


@objc(PeopleNSSecureCoding)
public class PeopleNSSecureCoding: NSObject, NSSecureCoding {
    
    public static var supportsSecureCoding: Bool = true
    
    var peopleList: [Residents]?

    
    required init(people: [Residents]?) {
        self.peopleList = people

    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(peopleList, forKey: "residents")

    }
    
    required public init?(coder: NSCoder) {
        
        peopleList = coder.decodeObject(of: NSArray.self, forKey: "residents") as? Array<Residents> ?? []

    }
}

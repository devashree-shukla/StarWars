//
//  Constants.swift
//  StarWars
//
//  Created by Devashree KS on 22/01/22.
//

import SwiftUI

struct StarWarsConstants {
    
    struct Texts {
        static let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        static let search = "Search"
        static let sort = "Sort"
        static let errorMessage = "Something went wrong, Try Again!"
        static let noInternet = "No intenet available, Please check."
    }
    
    static let backgroundOpacity = 0.2
    static let cornerRadius = 20.0
    
}


struct StoryboardIds {
    static let homeViewCell = "HomeViewCell"
    static let listViewCell = "ListViewCell"
    static let detailRowViewCell = "DetailRowViewCell"
    static let detailTabViewCell = "DetailTabViewCell"
    
    //Segues
    static let showListSegue = "showList"
    static let showDetailSegue = "showDetail"
}

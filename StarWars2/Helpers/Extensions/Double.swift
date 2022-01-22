//
//  CGFloat.swift
//  StarWars
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

extension Double {

    static var random: Double {
        return Double(arc4random()) / Double(UInt32.max)
    }

}

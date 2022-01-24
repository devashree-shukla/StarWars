//
//  UIStackView.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation
import UIKit

extension UIStackView {
    
    func removeAllSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}

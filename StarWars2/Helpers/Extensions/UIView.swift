//
//  UIView.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

}

// MARK: - Activity inidicator

extension UIView {

    func showDefaultActivityIndicator(shouldDisableUserInteraction: Bool = false) {

        self.removeAnyOldActivityIndicators()
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        self.addSubview(activityIndicator)
        self.bringSubviewToFront(activityIndicator)
        self.isUserInteractionEnabled = !shouldDisableUserInteraction
        activityIndicator.startAnimating()

    }

    func hideDefaultActivityIndicator() {

        for subview in self.subviews {
            if let indicator = subview as? UIActivityIndicatorView {
                indicator.stopAnimating()
            }
        }
        self.isUserInteractionEnabled = true

    }

    fileprivate func removeAnyOldActivityIndicators() {

        for subview in self.subviews {
            if let indicator = subview as? UIActivityIndicatorView {
                indicator.stopAnimating()
            }
        }

    }

}

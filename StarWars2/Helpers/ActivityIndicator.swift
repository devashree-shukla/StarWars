//
//  ActivityIndicator.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import UIKit


class ActivityIndicator: NSObject {
    let appDelegate = UIApplication.shared.delegate
    var parentView: UIView?
    var color: UIColor?

    /*
     If user has set the tintColor, the activityIndicator will have tint color as user set,
     If not, the default tintColor will be set as blackColor
     */

    var tintColor: UIColor? {
        get {
            guard let color = self.color else {
                return UIColor.red
            }
            return color

        } set {
            self.color = newValue
        }
    }

    /*
     If user has not provided view where activity indicator should pop up.
     The default view will be view of the current rootViewController of window.
     */

    var defaultView: UIView? {
        get {
            if let view = self.parentView {
                return view

            } else {
                return appDelegate?.window??.rootViewController?.view
            }
        }
    }
    

    var activityIndicatorView: UIActivityIndicatorView? {
        get {
            guard let indicatorView = self.defaultView?.superview?.viewWithTag(1024) as? UIActivityIndicatorView else {
                let activityIndicator              = UIActivityIndicatorView(style: .white)
                activityIndicator.frame            = CGRect(x: 100, y: 100, width: 100, height: 100)
                activityIndicator.center           = self.defaultView?.center ?? .zero
                activityIndicator.hidesWhenStopped = true
                activityIndicator.tag              = 1024
                activityIndicator.color            = self.tintColor
                activityIndicator.startAnimating()
                defaultView?.superview?.addSubview(activityIndicator)
                return activityIndicator
            }
            return indicatorView
        }
    }

    
    func start() {
        self.activityIndicatorView?.startAnimating()
        self.defaultView?.isUserInteractionEnabled = false
    }

    
    func stop() {
        self.activityIndicatorView?.stopAnimating()
        self.defaultView?.isUserInteractionEnabled = true
    }

}


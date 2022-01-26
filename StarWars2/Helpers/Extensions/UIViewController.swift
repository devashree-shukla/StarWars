//
//  AlertController.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation
import UIKit


extension UIViewController {
    
    var hasSafeArea: Bool {
        
        guard
            #available(iOS 11.0, tvOS 11.0, *)
            else {
                return false
            }
        return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        
    }

    
    func showAlert(title : String? = StarWarsConstants.Texts.appName, msg : String) {
        let ac = UIAlertController.init(title: title,
                                        message: msg, preferredStyle: .alert)
        ac.addAction(UIAlertAction.init(title: "OK",
                                        style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(ac, animated: true, completion: nil)
        }
    }
    
}


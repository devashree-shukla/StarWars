//
//  AlertController.swift
//  StarWars2
//
//  Created by Devashree KS on 24/01/22.
//

import Foundation
import UIKit

extension UIViewController {

    func showAlert(title: String? = StarWarsConstants.Texts.appName, msg: String) {
        let alertView = UIAlertController.init(title: title,
                                               message: msg, preferredStyle: .alert)
        alertView.addAction(UIAlertAction.init(title: "OK",
                                               style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alertView, animated: true, completion: nil)
        }
    }

}

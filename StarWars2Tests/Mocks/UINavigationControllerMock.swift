//
//  UINavigationControllerMock.swift
//  StarWars2Tests
//
//  Created by Devashree KS on 28/01/22.
//

import Foundation
import UIKit

final class UINavigationControllerMock: UINavigationController {
    var pushViewControllerCalled = false
    override func pushViewController(
        _ viewController: UIViewController, animated: Bool
    ) {
        super.pushViewController(viewController, animated: animated)
        pushViewControllerCalled = true
    }
    
    var presentCalled = false
    override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)? = nil
    ) {
        super.present(
            viewControllerToPresent, animated: flag, completion: completion
        )
        presentCalled = true
    }
}

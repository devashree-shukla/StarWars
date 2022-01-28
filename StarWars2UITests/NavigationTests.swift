//
//  NavigationTests.swift
//  StarWars2UITests
//
//  Created by Devashree KS on 28/01/22.
//

import XCTest
import StarWars2

final class NavigationTests: StarWars2UITests {
    private var sut: SomeViewController!
    private var navigationController: UINavigationControllerMock!
    
    override func setUp() {
        super.setUp()
        
        sut = SomeViewController()
        navigationController
            = UINavigationControllerMock(rootViewController: UIViewController())
        navigationController.pushViewController(sut, animated: false)
        navigationController.pushViewControllerCalled = false
    }
    
    override func tearDown() {
        sut = nil
        navigationController = nil
        
        super.tearDown()
    }
    
    func test_givenVC_whenPushMyVCCalled_thenPushOnNavigationCalled() {
        sut.pushMyVC()
        
        XCTAssertTrue(navigationController.pushViewControllerCalled)
    }
    
}

final class SomeViewController: UIViewController {
    func pushMyVC() {
        navigationController?.pushViewController(
            UIViewController(), animated: false
        )
    }
}

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

//
//  HomeCoordinator.swift
//  TestCoordinator
//
//  Created by Юнус Юнусов on 30.08.2021.
//

import UIKit


class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    private var navigationVC: UINavigationController?
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        navigationVC = UINavigationController(rootViewController: homeViewController)
        navigationVC?.navigationBar.prefersLargeTitles = true
        
        if window.rootViewController != nil {
            window.rootViewController = navigationVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {})
        } else {
            window.rootViewController = navigationVC
        }
        window.makeKeyAndVisible()
    }
    
    func showBruh() {
        guard let navigationVC = navigationVC else {
            return
        }
        
        let bruhCoordinator = BruhCoordinator(navigationVC: navigationVC)
        addChildCoordinator(bruhCoordinator)
        bruhCoordinator.start()
    }
}

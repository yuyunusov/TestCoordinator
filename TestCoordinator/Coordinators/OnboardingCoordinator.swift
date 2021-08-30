//
//  OnboardingCoordinator.swift
//  TestCoordinator
//
//  Created by Юнус Юнусов on 30.08.2021.
//

import UIKit

protocol OnboardingCoordinatorDelegate: AnyObject {
    func didFinishOnboarding(_ coordinator: OnboardingCoordinator)
}

class OnboardingCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    var delegate: OnboardingCoordinatorDelegate?
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let onboardingViewController = OnboardingViewController()
        onboardingViewController.coordinator = self
        
        window.rootViewController = onboardingViewController
        window.makeKeyAndVisible()
    }
    
    func didFinishOnboarding() {
        delegate?.didFinishOnboarding(self)
    }
}

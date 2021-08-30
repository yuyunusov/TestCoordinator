//
//  AppCoordinator.swift
//  TestCoordinator
//
//  Created by Юнус Юнусов on 30.08.2021.
//

import UIKit

class AppCoordinator: Coordinator {
    enum State {
        case onboarding
        case home
    }
    
    var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    private var state: State = .onboarding
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        switchTo(state)
    }
    
    func switchTo(_ state: State) {
        let coordinator = getCoordinator(state)
        coordinator.start()
    }
    
    func getCoordinator(_ state: State) -> Coordinator {
        if state == .onboarding {
            let coordinator = OnboardingCoordinator(window)
            coordinator.delegate = self
            addChildCoordinator(coordinator)
            return coordinator
        } else {
            let coordinator = HomeCoordinator(window)
            addChildCoordinator(coordinator)
            return coordinator
        }
    }
}

extension AppCoordinator: OnboardingCoordinatorDelegate {
    func didFinishOnboarding(_ coordinator: OnboardingCoordinator) {
        removeChildCoordinator(coordinator)
        state = .home
        switchTo(state)
    }
}

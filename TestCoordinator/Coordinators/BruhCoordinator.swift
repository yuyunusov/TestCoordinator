//
//  BruhCoordinator.swift
//  TestCoordinator
//
//  Created by Юнус Юнусов on 30.08.2021.
//

import UIKit

class BruhCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    private let navigationVC: UINavigationController
    
    init(navigationVC: UINavigationController) {
        self.navigationVC = navigationVC
    }
    
    func start() {
        let bruhVC = BruhViewController()
        bruhVC.coordinator = self
        
        let navVC = UINavigationController(rootViewController: bruhVC)
        
        navigationVC.present(navVC, animated: true)
    }
}

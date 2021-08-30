//
//  OnboardingViewController.swift
//  TestCoordinator
//
//  Created by Юнус Юнусов on 30.08.2021.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var coordinator: OnboardingCoordinator?
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Finish onboarding", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        button.addTarget(self, action: #selector(didFinishOnboarding), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.backgroundColor = .yellow
        
        view.addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 44),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func didFinishOnboarding() {
        coordinator?.didFinishOnboarding()
    }
}

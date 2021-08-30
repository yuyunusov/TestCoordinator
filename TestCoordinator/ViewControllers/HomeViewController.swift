//
//  HomeViewController.swift
//  TestCoordinator
//
//  Created by Юнус Юнусов on 30.08.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    var coordinator: HomeCoordinator?
    
    private lazy var bruhButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("BRUH", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        bruhButton.addTarget(self, action: #selector(bruhButtonPressed), for: .touchUpInside)
    }
    
    private func setupUI() {
        navigationItem.title = "Home"
        
        view.backgroundColor = .systemBlue
        
        view.addSubview(bruhButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bruhButton.heightAnchor.constraint(equalToConstant: 44),
            bruhButton.widthAnchor.constraint(equalToConstant: 150),
            bruhButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bruhButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func bruhButtonPressed() {
        coordinator?.showBruh()
    }
}

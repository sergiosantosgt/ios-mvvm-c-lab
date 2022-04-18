//
//  HomeCoordinator.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 12/04/22.
//

import Foundation

class HomeCoordinator: BaseCoordinator  {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = HomeViewController.instantiate()
        viewController.viewModel = viewModel
        
        navigationController.isNavigationBarHidden = true
        navigationController.viewControllers = [viewController]
    }
}

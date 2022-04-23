//
//  RegisterCoordinator.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 23/04/22.
//

class RegisterCoordinator: BaseCoordinator {
    private let viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        setupBinding()
        
        let viewController = RegisterViewController.instantiate()
        viewController.viewModel = viewModel
        
        navigationController.isNavigationBarHidden = true
        navigationController.viewControllers = [viewController]
    }
    
    private func setupBinding() {
    }
}

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
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func setupBinding() {
        viewModel.viewDidDisapear.subscribe(to: self) { this, _ in
            this.parentCoordinator?.didFinish(coordinator: this)
        }
    }
}

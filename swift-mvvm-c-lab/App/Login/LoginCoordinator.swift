//
//  LoginCoordinator.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

class LoginCoordinator: BaseCoordinator {
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        setupBinding()
        
        let viewController = LoginViewController.instantiate()
        viewController.viewModel = viewModel
        
        navigationController.isNavigationBarHidden = true
        navigationController.viewControllers = [viewController]
    }
    
    private func setupBinding() {
        viewModel.didTapLogin.subscribe(to: self) { this, _ in
            this.showHome()
        }
    }
    
    private func showHome() {
        Logger.info("Home Screen")
        
        removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(HomeCoordinator.self)!
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)
    }
}

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
        
        navigationController.isNavigationBarHidden = false
        self.navigationController.viewControllers = [viewController]
    }
    
    private func setupBinding() {
        viewModel.didTapLogin.subscribe(to: self) { this, _ in
            this.showHome()
        }
        
        viewModel.didTapRegister.subscribe(to: self) { this, _ in
            this.showRegister()
        }
        
        viewModel.viewDidDisappear.subscribe(to: self) { this, _ in
            this.parentCoordinator?.didFinish(coordinator: this)
        }
    }
    
    private func showHome() {
        Logger.info("Home Screen")
        
        removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(HomeCoordinator.self)!
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)
    }
    
    private func showRegister() {
        Logger.info("Register Screen")
        
        removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(RegisterCoordinator.self)!
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)
    }
}

//
//  AppCoordinator.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 12/04/22.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator {
    private let disposeBag = DisposeBag()
    private let sessionService: SessionService
    private var window = UIWindow(frame: UIScreen.main.bounds)
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    override func start() {
        window.makeKeyAndVisible()
        showLogin()
    }
    
    private func showLogin() {
        removeChildCoordinators()
        
        let coordinator = AppDelegate.container.resolve(LoginCoordinator.self)!
        start(coordinator: coordinator)
        
        ViewControllerUtils.setRootViewController(
            window: window,
            viewController: coordinator.navigationController,
            withAnimation: true)
    }
}

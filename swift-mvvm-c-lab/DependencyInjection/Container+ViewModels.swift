//
//  Container+ViewModels.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerViewModels() {
        autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
        autoregister(LoginViewModel.self, initializer: LoginViewModel.init)
        autoregister(RegisterViewModel.self, initializer: RegisterViewModel.init)
    }
}


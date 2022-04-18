//
//  LoginViewModel.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation
import RxSwift

class LoginViewModel {
    private let sessionService: SessionService
    private let disposeBag = DisposeBag()
    
    let didTapLogin = DelegateView<Void>()
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
}

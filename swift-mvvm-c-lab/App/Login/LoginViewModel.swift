//
//  LoginViewModel.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation
import RxSwift
import FirebaseAuth

class LoginViewModel {
    private let sessionService: SessionService
    private let disposeBag = DisposeBag()
    
    let didTapLogin = DelegateView<Void>()
    let didTapRegister = DelegateView<Void>()
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    public func doLogin(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        
        // Firebase auth
        let firebaseService = FirebaseService()
        firebaseService.autenticate(email: email, password: password, completion: { (user, error) in
            if error == nil {
                if user == nil {
                    print("USER Login Error")
                    completion(false)
                } else {
                    completion(true)
                    print("USER Login Success \(String(describing: user?.user.uid))")
                    self.didTapLogin.accept?(())
                }
            } else {
                completion(false)
            }
            
        })
            
    }
    
    public func doRegister() {
        self.didTapRegister.accept?(())
    }
}

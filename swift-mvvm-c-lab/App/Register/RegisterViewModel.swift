//
//  RegisterViewModel.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 23/04/22.
//

import Foundation
import RxSwift

class RegisterViewModel {
    let viewDidDisapear = DelegateView<Void>()
    let didTapRegister = DelegateView<Void>()
    
    public func doRegister(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        // Firebase auth
        let firebaseService = FirebaseService()
        firebaseService.register(email: email, password: password, completion: { (user, error) in
            if error == nil {
                if user == nil {
                    completion(false)
                } else {
                    completion(true)
                }
            } else {
                completion(false)
            }
        })
    }
    
    public func goToHome() {
        self.didTapRegister.accept?(())
    }
}

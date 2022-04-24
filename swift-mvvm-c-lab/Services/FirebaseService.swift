//
//  FirebaseService.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 18/04/22.
//

import FirebaseAuth

class FirebaseService {
    
    public func autenticate(email: String, password: String, completion: @escaping (_ user: AuthDataResult?, _ error: Error?) -> Void) {
        let autenticacao = Auth.auth()
        autenticacao.signIn(withEmail: email, password: password) { (user, error) in
            completion(user, error)
        }
    }
    
    public func register(email: String, password: String, completion: @escaping (_ user: AuthDataResult?, _ error: Error?) -> Void) {
        let autentication = Auth.auth()
        autentication.createUser(withEmail: email, password: password) { (user, error) in
            completion(user, error)
        }
    }
}

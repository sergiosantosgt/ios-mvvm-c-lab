//
//  SessionEndpoints.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

enum SessionEndpoints {
    class SignIn: ApiRequest<SignInResponse> {
        init(credentials: Credentials) {
            super.init(resource: "login",
                       method: .post,
                       json: SignInRequest(username: credentials.username, password: credentials.password).toJson())
        }
    }
    
    class SignOut: ApiRequest<VoidResponse> {
        init() {
            super.init(resource: "logout",
                       method: .post)
        }
    }
    
    class FetchMe: ApiRequest<MeResponse> {
        init() {
            super.init(resource: "me")
        }
    }
}

//
//  HttpClient.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

protocol HttpClient {
    func set(headers: [String:String])
    func request(resource: String, method: HttpMethod, json: Data?,
                 completion: @escaping (ApiResponse) -> Void)
}

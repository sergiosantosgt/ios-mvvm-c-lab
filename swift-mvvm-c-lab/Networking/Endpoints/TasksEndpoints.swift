//
//  TasksEndpoints.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

import Foundation

enum TasksEndpoints {
    class FetchTasks: ApiRequest<[String]> {
        init() {
            super.init(resource: "tasks")
        }
    }
}

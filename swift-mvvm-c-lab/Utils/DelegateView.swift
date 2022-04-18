//
//  DelegateView.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 14/04/22.
//

import Foundation

class DelegateView<Input> {
    private(set) var accept: ((Input) -> Void)?
    
    func subscribe<Context: AnyObject>(to context: Context, with onNext: @escaping (Context, Input) -> Void) {
        self.accept = { [weak context] input in
            guard let object = context else {
                return
            }
            onNext(object, input)
        }
    }
}

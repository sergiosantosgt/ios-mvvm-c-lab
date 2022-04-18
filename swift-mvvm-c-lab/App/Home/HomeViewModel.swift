//
//  HomeViewModel.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 12/04/22.
//

import RxSwift

class HomeViewModel {
    private let sessionService: SessionService
    private let disposeBag = DisposeBag()
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
}

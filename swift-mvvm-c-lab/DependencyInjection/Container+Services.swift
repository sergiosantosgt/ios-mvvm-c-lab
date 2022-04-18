//
//  Container+Services.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerServices() {
        autoregister(BackendRestClient.self, initializer: BackendRestClient.init).inObjectScope(.container)
        autoregister(AlertDispatcher.self, initializer: AlertDispatcher.init).inObjectScope(.container)
        autoregister(SessionService.self, initializer: SessionService.init).inObjectScope(.container)
        autoregister(TranslationsService.self, initializer: TranslationsService.init).inObjectScope(.container)
        autoregister(HttpClient.self, initializer: HttpClientMock.init).inObjectScope(.container)
        autoregister(DataManager.self, initializer: UserDataManager.init).inObjectScope(.container)
    }
}

//
//  GeneralEndpoints.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

enum GeneralEndpoints {
    class FetchTranslations: ApiRequest<TranslationsResponse> {
        init() {
            super.init(resource: "translations")
        }
    }
}


//
//  OnBoardingData.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

struct OnBoardingData: Codable {
    let firstName: String
    let lastName: String
    let notifications: Bool
    let gpsTracking: Bool
}


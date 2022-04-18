//
//  AppDelegate.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 12/04/22.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var appCoordinator: AppCoordinator!
    
    static let container = Container()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Container.loggingFunction = nil
        AppDelegate.container.registerDependencies()
        appCoordinator = AppDelegate.container.resolve(AppCoordinator.self)!
        appCoordinator.start()
        return true
    }

}


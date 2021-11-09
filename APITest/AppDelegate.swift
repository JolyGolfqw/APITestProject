//
//  AppDelegate.swift
//  APITest
//
//  Created by MacBook Pro on 30.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    var rootNavigationController = UINavigationController()
    let accountManager = AccountManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        if UserDefaults.isFirstLaunch() {
            let onboardViewController = UIStoryboard.get(OnboardViewController.self)
            self.rootNavigationController = UINavigationController(rootViewController: onboardViewController)
            KeychainStorage.shared.clear()
        } else
        
        if KeychainStorage.shared.getToken() == nil {
            let authViewController = UIStoryboard.get(AuthViewController.self)
            self.rootNavigationController = UINavigationController(rootViewController: authViewController)
        } else {
            let mainViewController = MainViewController()
            self.rootNavigationController = UINavigationController(rootViewController: mainViewController)
        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.rootNavigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}


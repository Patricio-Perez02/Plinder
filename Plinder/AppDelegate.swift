//
//  AppDelegate.swift
//  Plinder
//
//  Created by Patricio Perez on 21/07/2020.
//  Copyright © 2020 Patricio Perez. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

      func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        loginView()
        return true
      }
    
    private func loginView () {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let lv = HomeViewController()
        let navigationController = UINavigationController(rootViewController: lv)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        navigationController.navigationBar.isHidden = true
    }
    

}


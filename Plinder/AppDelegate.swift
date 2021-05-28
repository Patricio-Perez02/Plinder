//
//  AppDelegate.swift
//  Plinder
//
//  Created by Patricio Perez on 21/07/2020.
//  Copyright © 2020 Patricio Perez. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ApplicationDelegate.shared.application( application, didFinishLaunchingWithOptions: launchOptions)
        
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        loginView()
        return true
    }
    
    private func loginView () {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let lv = TutorialViewController()
        let navigationController = UINavigationController(rootViewController: lv)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        navigationController.navigationBar.isHidden = true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance()?.handle(url) ?? false ||
        ApplicationDelegate.shared.application( app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] )
    }

}


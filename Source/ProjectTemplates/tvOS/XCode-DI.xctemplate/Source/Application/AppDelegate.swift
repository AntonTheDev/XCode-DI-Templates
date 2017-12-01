//
//  AppDelegate.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var services = Services()
    var baseNavViewController: UINavigationController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let homeViewController = services.viewControllerContainer.resolve(BaseViewController.self)
        
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

//
//  Services.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import UIKit
import Swinject

enum NetworkQoS : String  {
    case background         = ".background"
    case utility            = ".utility"
    case `default`          = ".default"
    case userInitiated      = ".userInitiated"
    case userInteractive    = ".userInteractive"
}

class Services {
    
    var dataServicesContainer = Container()
    var viewControllerContainer = Container()
    
    init() {
        registerServices()
        registerViewControllers()
    }
    
    func registerServices() {
        
    }
    
    func registerViewControllers() {
        
        viewControllerContainer.register(HomeViewController.self) { _ in HomeViewController(container: self.viewControllerContainer) }
            .initCompleted { (r, controller) in

        }
    }
}

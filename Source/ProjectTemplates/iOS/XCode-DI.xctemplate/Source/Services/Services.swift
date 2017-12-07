//
//  Services.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import UIKit
import Swinject

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
        
        viewControllerContainer.register(BaseViewController.self) { _ in BaseViewController(container: self.viewControllerContainer) }
            .initCompleted { (r, controller) in

        }
    }
}

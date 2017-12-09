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
        
        dataServicesContainer.register(NetworkingService.self, name: NetworkQoS.default.rawValue) { r in
            let service = NetworkingService(name: NetworkQoS.default.rawValue, qos: .default)
            return service
            }.inObjectScope(.container)
    }
    
    func registerViewControllers() {
        
        viewControllerContainer.register(BaseViewController.self) { _ in BaseViewController(container: self.viewControllerContainer) }
            .initCompleted { (r, controller) in

        }
    }
}

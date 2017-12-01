//
//  BaseViewController.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import Foundation
import UIKit
import Swinject

class BaseViewController : UIViewController {
    
    var pageTitle: String {
        get {
            return "Override In Subclass"
        }
    }
    
    var serviceContainer : Container?
    
    required init(container : Container) {
        serviceContainer = container
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        configureData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        styleInterface()
        layoutInterface()
    }
    
    func configureData() {
        /* Override in subclass and add all the layout logic */
    }
    
    func setupInterface() {
        /* Override in subclass to add all the subviews */
    }
    
    func styleInterface() {
        /* Override in subclass to style, ie set fonts, color, text */
    }

    func layoutInterface() {
         /* Override in subclass and add all the layout logic */
    }
    
    func trackPageView() {
        /*  TODO: Create Base Analytics Protocol Later */
    }
}

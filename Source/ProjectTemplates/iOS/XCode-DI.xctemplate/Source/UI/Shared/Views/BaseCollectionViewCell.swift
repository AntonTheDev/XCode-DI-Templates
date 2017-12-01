//
//  BaseCollectionViewCell.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import Foundation
import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInterface()
        styleInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInterface()
        styleInterface()
    }
    
    func configureData() {
        // Override in subclass to confire the data to be displayed
    }
    
    func setupInterface() {
        // Override in subclass, configure the view hiearchy
    }
    
    func styleInterface() {
        // Override in subclass, configure view style properties if needed
    }
    
    func layoutInterface() {
        // Override in subclass, layout all the subvies in this method
    }
}

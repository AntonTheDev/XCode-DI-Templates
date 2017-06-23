//
//  BaseView.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import Foundation
import UIKit

class BaseView : UIView {

    var needsLayout = true
    var animating = false

    convenience init() {
        self.init(frame: .zero)
        setupInterface()
        styleInterface()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInterface()
        styleInterface()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard needsLayout else {
            return
        }

        needsLayout = false
        layoutInterface()
    }

    func setupInterface() {
        // Override in subclass, configure the view hierarchy
    }

    func styleInterface() {
        // Override in subclass, configure view style properties if needed
    }

    func layoutInterface() {
        // Override in subclass, configure layout logic accordingly.
        // When layoutSubviews is called, the needs layout flag is set
        // to false, ensure you set the flag to true as needed when the
        // content of the view changes. This is to ensure that layoutSubviews
        // is not called inadvertently while animating, or interpolating
        // views on the screen relative to gestures
    }
}

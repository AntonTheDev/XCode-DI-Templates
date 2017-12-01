//
//  DateFormatter+Extras.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import Foundation
import UIKit

extension DateFormatter {
    convenience init(withFormat format : String) {
        self.init()
        dateFormat = format
    }
}

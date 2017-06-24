//
//  NSMutableAttributedString+PSD.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import Foundation
import UIKit

extension NSMutableAttributedString {
 
    convenience init?(copyString: String?,
                          font : UIFont,
                          tracking : CGFloat = 0.0,
                          leading : CGFloat = 0.0,
                          textAlignment : NSTextAlignment = NSTextAlignment.left,
                          lineBreakMode : NSLineBreakMode = NSLineBreakMode.byTruncatingTail,
                          color : UIColor = UIColor.white,
                          underlined : Bool = false)
    {
        self.init(string: copyString ?? "")
    
        let attributes = customAttributes(font: font,
                                          tracking : tracking,
                                          leading : leading,
                                          textAlignment : textAlignment,
                                          lineBreakMode : lineBreakMode,
                                          color : color,
                                          underlined : underlined)

        setAttributes(attributes, range: NSMakeRange(0, length))
    }
    
    private func customAttributes(font : UIFont,
                          tracking : CGFloat = 0.0,
                          leading : CGFloat = 0.0,
                          textAlignment : NSTextAlignment = NSTextAlignment.left,
                          lineBreakMode : NSLineBreakMode = NSLineBreakMode.byTruncatingTail,
                          color : UIColor = UIColor.white,
                          underlined : Bool = false) -> Dictionary<String , AnyObject>
    {
        var attributes = Dictionary<String , AnyObject>()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = leading / 2.0
        paragraphStyle.maximumLineHeight = leading / 2.0
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineBreakMode = lineBreakMode
        
        if underlined {
            attributes[NSUnderlineStyleAttributeName] = NSUnderlineStyle.styleSingle.rawValue as AnyObject?
        }
        
        attributes[NSParagraphStyleAttributeName] = paragraphStyle
        attributes[NSForegroundColorAttributeName] = color
        attributes[NSFontAttributeName] = font
        
        if tracking != 0.0 {
            attributes[NSKernAttributeName] =  (font.pointSize * tracking / CGFloat(1000.0) as AnyObject?)
        }
        
        return attributes
    }
    
}

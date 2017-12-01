//
//  NSMutableAttributedString+PSD.swift
//  HUGE START
//
//  Copyright © 2017 HUGE Inc. All rights reserved.

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
                      underlined : Bool = false,
                      bold : Bool = false)
    {
        self.init(string: copyString ?? "")
        
        let attributes = customAttributes(font: font,
                                          tracking : tracking,
                                          leading : leading,
                                          textAlignment : textAlignment,
                                          lineBreakMode : lineBreakMode,
                                          color : color,
                                          underlined : underlined,
                                          bold : bold)
        
        setAttributes(attributes, range: NSMakeRange(0, length))
    }
    
    private func customAttributes(font : UIFont,
                                  tracking : CGFloat = 0.0,
                                  leading : CGFloat = 0.0,
                                  textAlignment : NSTextAlignment = NSTextAlignment.left,
                                  lineBreakMode : NSLineBreakMode = NSLineBreakMode.byTruncatingTail,
                                  color : UIColor = UIColor.white,
                                  underlined : Bool = false,
                                  bold : Bool = false) -> Dictionary<NSAttributedStringKey , AnyObject>
    {
        var attributes = Dictionary<NSAttributedStringKey , AnyObject>()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = leading / 2.0
        paragraphStyle.maximumLineHeight = leading / 2.0
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineBreakMode = lineBreakMode
        
        if underlined {
            attributes[NSAttributedStringKey.underlineStyle] = NSUnderlineStyle.styleSingle.rawValue as AnyObject?
        }
        
        attributes[NSAttributedStringKey.paragraphStyle] = paragraphStyle
        attributes[NSAttributedStringKey.foregroundColor] = color
        
        if bold {
            attributes[NSAttributedStringKey.font] = UIFont(descriptor: font.fontDescriptor.withSymbolicTraits(.traitBold)!, size: font.pointSize)
        } else {
            attributes[NSAttributedStringKey.font] = font
        }
        
        if tracking != 0.0 {
            attributes[NSAttributedStringKey.kern] =  (font.pointSize * tracking / CGFloat(1000.0) as AnyObject?)
        }
        
        return attributes
    }
}


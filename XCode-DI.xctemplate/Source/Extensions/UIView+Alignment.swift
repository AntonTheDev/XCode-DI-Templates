//
//  UIView+Alignment.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import Foundation
import UIKit

func alignedHorizontalOriginWithFrame(_ source : CGRect,  dest : CGRect, align : HGHorizontalAlign) -> CGFloat {
    var origin = source.origin.x
    
    switch (align) {
    case .left:
        origin = dest.origin.x - source.size.width;
    case .right:
        origin = dest.maxX;
    case .center:
        origin = dest.origin.x + ((dest.size.width - source.size.width) / 2.0);
    case .leftEdge:
        origin = dest.origin.x;
    case .rightEdge:
        origin = dest.maxX - source.size.width;
    }
    return round(origin)
}

func alignedVerticalOriginWithFrame(_ source : CGRect,  dest : CGRect, align : HGVerticalAlign) -> CGFloat {
    var origin = source.origin.x
    
    switch (align) {
    case .top:
        origin = dest.origin.y
    case .base:
        origin = dest.maxY - source.size.height
    case .center:
        origin = dest.origin.y + ((dest.size.height - source.size.height) / 2.0)
    case .above:
        origin = dest.origin.y - source.size.height
    case .below:
        origin = dest.maxY
    }
    return round(origin)
}

enum HGVerticalAlign {
    case top
    case base
    case center
    case above
    case below
}

enum HGHorizontalAlign {
    case left
    case right
    case center
    case rightEdge
    case leftEdge
}

extension UIView {
    
    func alignToView(_ otherView : UIView, horizontal:  HGHorizontalAlign, vertical : HGVerticalAlign , horizontalOffset : CGFloat = 0.0, verticalOffset : CGFloat = 0.0) {
        self.alignToFrame(otherView.frame, horizontal : horizontal, vertical : vertical,  horizontalOffset : horizontalOffset, verticalOffset : verticalOffset)
    }
    
    func alignToFrame(_ otherFrame : CGRect,
                      horizontal       : HGHorizontalAlign,
                      vertical         : HGVerticalAlign,
                      horizontalOffset : CGFloat = 0.0,
                      verticalOffset   : CGFloat = 0.0) {
        
        let x = alignedHorizontalOriginWithFrame(self.frame, dest:otherFrame, align : horizontal)
        let y = alignedVerticalOriginWithFrame(self.frame, dest:otherFrame, align :  vertical)
        
        let newRect = CGRect(x: x + horizontalOffset, y: y + verticalOffset, width: self.frame.size.width, height: self.frame.size.height).integral
        
        if self.frame.equalTo(newRect) == false {
            self.frame = newRect
        }
    }
    
    func alignWithSize(_ newSize : CGSize,
                       toFrame          : CGRect,
                       horizontal       : HGHorizontalAlign,
                       vertical         : HGVerticalAlign,
                       horizontalOffset : CGFloat = 0.0,
                       verticalOffset   : CGFloat = 0.0) {
        
        var newRect =  CGRect(x: 0,y: 0, width: newSize.width, height: newSize.height)
        
        newRect.origin.x = alignedHorizontalOriginWithFrame(newRect, dest:toFrame, align : horizontal) + horizontalOffset
        newRect.origin.y = alignedVerticalOriginWithFrame(newRect, dest:toFrame, align :  vertical) + verticalOffset
        
        if self.frame.equalTo(newRect.integral) == false {
            self.frame = newRect.integral
        }
    }

    //convenience methods for retrieving UIView geometry values
    func yPosition() -> CGFloat {
        return self.frame.origin.y
    }

    func xPosition() -> CGFloat {
        return self.frame.origin.x
    }

    func width() -> CGFloat {
        return self.bounds.size.width
    }

    func height() -> CGFloat {
        return self.bounds.size.height
    }

    func size() -> CGSize {
        return self.frame.size
    }

    func layoutY(yPos:CGFloat){
        var frame = self.frame
        frame.origin.y = yPos
        self.frame = frame
    }

    func layoutX(xPos:CGFloat){
        var frame = self.frame
        frame.origin.x = xPos
        self.frame = frame
    }

    func layoutWidth(width:CGFloat){
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
    }

    func layoutHeight(height:CGFloat){
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
}


//
//  UIView+Geometry.swift
//  Xcode Flight
//
//  Copyright © 2017 Anton Doudarev. All rights reserved.

import Foundation
import UIKit

func CGCSRectGetTopLeft(_ rect : CGRect) -> CGPoint {
    return CGPoint(x: rect.minX, y: rect.minY)
}

func CGCSRectGetBottomLeft(_ rect : CGRect) -> CGPoint {
    return CGPoint(x: rect.minX, y: rect.maxY)
}

func CGCSRectGetTopRight(_ rect : CGRect) -> CGPoint {
    return CGPoint(x: rect.maxX, y: rect.minY)
}

func CGCSRectGetBottomRight(_ rect : CGRect) -> CGPoint {
    return CGPoint(x: rect.maxX, y: rect.maxY)
}

func CGCSRectEdgeInset(_ inputFrame : CGRect, edgeInsets : UIEdgeInsets) -> CGRect {
    var retval :CGRect  = CGRect(x: inputFrame.origin.x + edgeInsets.left, y: inputFrame.origin.y + edgeInsets.top, width: 0, height: 0)
    retval.size.width = inputFrame.width - (edgeInsets.left + edgeInsets.right)
    retval.size.height = inputFrame.height - (edgeInsets.top + edgeInsets.bottom)
    return retval
}

func CGCSRectEdgeOutset(_ inputFrame : CGRect, edgeInsets : UIEdgeInsets) -> CGRect {
    let invertedEdgeInsets : UIEdgeInsets = UIEdgeInsetsMake(-edgeInsets.top, -edgeInsets.left, -edgeInsets.bottom, -edgeInsets.right)
    return CGCSRectEdgeInset(inputFrame, edgeInsets: invertedEdgeInsets)
}

func CGCSRectCenterInRect(_ sourceRect : CGRect, destRect : CGRect) -> CGRect {
    var newRect : CGRect = sourceRect
    newRect.origin.x = destRect.origin.x + (destRect.size.width - sourceRect.size.width) / 2.0
    newRect.origin.y = destRect.origin.y + (destRect.size.height - sourceRect.size.height) / 2.0
    return newRect
}

func CGCSPointVerticalCenterBetweenRect(_ topRect : CGRect, bottomRect : CGRect) -> CGPoint {
    let topCenter : CGPoint = CGCSRectGetCenter(topRect)
    let topBottomY = topRect.maxY
    let bottomTopY = bottomRect.minY
    return CGPoint(x: topCenter.x, y: topBottomY + (bottomTopY - topBottomY) / 2.0)
}

func CGCSRectAspectFitRatio(_ inRect : CGRect, maxRect : CGRect) -> CGFloat {
    if (inRect.width == 0 || inRect.height == 0) {
        return 1.0
    }
    
    let horizontalRatio = maxRect.width / inRect.width
    let verticalRatio = maxRect.height / inRect.height
    return (horizontalRatio < verticalRatio ? horizontalRatio : verticalRatio)
}

func CGCSRectAspectFit(_ inRect : CGRect, maxRect : CGRect) -> CGRect {
    let ratio = CGCSRectAspectFitRatio(inRect, maxRect: maxRect)
    let newSize = CGSize(width: inRect.width * ratio, height: inRect.height * ratio)
    
    return CGRect(x: (maxRect.width - newSize.width) / 2.0 + maxRect.origin.x,
                      y: (maxRect.height - newSize.height) / 2.0 + maxRect.origin.y,
                      width: newSize.width,
                      height: newSize.height)
}

func CGCSRectAspectFillRatio(_ inRect : CGRect, maxRect : CGRect) -> CGFloat {
    if inRect.width == 0 || inRect.height == 0 {
        return 1.0
    }
    
    let horizontalRatio = maxRect.width / inRect.width
    let verticalRatio = maxRect.height / inRect.height
    return (horizontalRatio < verticalRatio ? verticalRatio : horizontalRatio)
}

func CGCSRectAspectFill(_ inRect : CGRect, maxRect : CGRect) -> CGRect {
    let ratio = CGCSRectAspectFillRatio(inRect, maxRect: maxRect)
    let newSize = CGSize(width: inRect.width * ratio, height: inRect.height * ratio)
    
    return CGRect(x: (maxRect.width - newSize.width) / 2.0 + maxRect.origin.x,
                      y: (maxRect.height - newSize.height) / 2.0 + maxRect.origin.y,
                      width: newSize.width,
                      height: newSize.height)
}

func CGCSRectGetCenter(_ inRect : CGRect) -> CGPoint {
    return CGPoint(x: ceil(inRect.origin.x + inRect.width * 0.5), y: ceil(inRect.origin.y + inRect.height * 0.5))
}

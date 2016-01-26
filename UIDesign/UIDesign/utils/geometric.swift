//
//  geometric.swift
//  UIDesign
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit


// CGRect
public func CGRectWith(size size: CGSize) -> CGRect {
    let origin = CGPointZero
    return CGRect(origin: origin, size: size)
}


// CGPoint
public func CGPointOffset(point: CGPoint, x: CGFloat, y: CGFloat) -> CGPoint {
    return CGPointMake(point.x + x, point.y + y)
}
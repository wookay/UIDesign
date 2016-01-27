//
//  views.swift
//  UIDesign
//
//  Created by wookyoung on 1/27/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

extension UIView {
    public func staySubview(lower lower: UIView, upper: UIView) {
        if lower.superview == self && upper.superview == self {
            if let index1 = subviews.indexOf(lower), index2 = subviews.indexOf(upper) {
                if index1 > index2 {
                    exchangeSubviewAtIndex(index1, withSubviewAtIndex: index2)
                }
            }
        }
    }
}
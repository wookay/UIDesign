//
//  WRelative.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

enum SideType {
    case left
    case right
    case top
    case bottom
}

public struct WRelative {
    var source: UIView
    var side: SideType
}

extension UIView {
    public var rightside: WRelative {
        return WRelative(source: self, side: .right)
    }
    public var bottomside: WRelative {
        return WRelative(source: self, side: .bottom)
    }
}
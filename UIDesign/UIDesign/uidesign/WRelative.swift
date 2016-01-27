//
//  WRelative.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

enum SideType {
    case leftside
    case rightside
    case topside
    case bottomside
    case upper
    case lower
}

public struct WRelative {
    var source: UIView
    var side: SideType
}

extension UIView {
    public var rightside: WRelative {
        return WRelative(source: self, side: .rightside)
    }
    public var bottomside: WRelative {
        return WRelative(source: self, side: .bottomside)
    }
    public var upper: WRelative {
        return WRelative(source: self, side: .upper)
    }
    public var lower: WRelative {
        return WRelative(source: self, side: .lower)
    }
}


public func move(view: UIView, to: WRelative) {
    switch view {
    case var w as WPosition:
        w.relative = to
    default:
        break
    }
}
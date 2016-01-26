//
//  WPosition.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

public protocol WPosition {
    var relative: WRelative? { get set }
}


public func move(view: UIView, to: WRelative) {
    switch view {
    case var w as WPosition:
        w.relative = to
    default:
        break
    }
}


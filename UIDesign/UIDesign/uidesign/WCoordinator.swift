//
//  WCoordinator.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

enum ViewType {
    case view
    case label
    case button
}


class WCoordinator {
    var source: WView? = nil
    
    init(source: UIView) {
        let w = WView(frame: source.frame)
        self.source = w
        source.addSubview(w)
    }
    
    init() {
    }
    
    func add(sub: UIView) {
        self.source?.addSubview(sub)
    }
    
    func realign() {
        self.source?.realign()
    }
    
    func next_origin() -> CGPoint {
        var origin = CGPointMake(default_side_spacing, default_side_spacing)
        for subview: UIView in self.source!.subviews {
            switch subview {
            case let w as WPosition:
                if nil == w.relative {
                    origin.y += subview.frame.height + default_vertical_spacing
                }
            default:
                break
            }
        }
        return origin
    }
    
    func frame(type: ViewType) -> CGRect {
        var size: CGSize
        switch type {
        case .view:
             size = default_view_size
        case .label:
            size = default_label_size
        case .button:
            size = default_button_size
        }
        return CGRect(origin: next_origin(), size: size)
    }
}
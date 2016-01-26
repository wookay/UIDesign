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
    let view: WView
    
    init(view: UIView) {
        let w = WView(frame: view.frame)
        self.view = w
        view.addSubview(w)
    }
    
    func add(sub: UIView) {
        self.view.addSubview(sub)
    }
    
    func realign() {
        var bottom: CGPoint = CGPointZero
        
        var origin = CGPointMake(side_spacing, side_spacing)
        for subview: UIView in self.view.subviews {
            switch subview {
            case let w as WPosition:
                if nil == w.relative {
                    let size = subview.frame.size
                    subview.frame = CGRect(origin: origin, size: size)
                    origin.y += size.height + vertical_spacing
                    bottom.x = max(bottom.x, origin.x + size.width)
                    bottom.y = max(bottom.y, origin.y)
                }
            default:
                break
            }
        }
        
        for subview: UIView in self.view.subviews {
            switch subview {
            case let w as WPosition:
                if nil != w.relative {
                    let relative = w.relative!
                    var origin = relative.source.frame.origin
                    switch relative.side {
                    case .right:
                        origin.x += relative.source.frame.width + side_spacing
                    default:
                        origin.y += relative.source.frame.height + side_spacing
                    }
                    let size = subview.frame.size
                    subview.frame = CGRect(origin: origin, size: size)
                    bottom.x = max(bottom.x, origin.x + size.width)
                    bottom.y = max(bottom.y, origin.y)
                }
            default:
                break
            }
        }

        self.view.frame = CGRect(origin: CGPointMake(side_spacing, side_spacing),
                                 size: CGSizeMake(bottom.x + side_spacing, bottom.y))
    }
    
    func next_origin() -> CGPoint {
        var origin = CGPointMake(side_spacing, side_spacing)
        for subview: UIView in self.view.subviews {
            switch subview {
            case let w as WPosition:
                if nil == w.relative {
                    origin.y += subview.frame.height + vertical_spacing
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
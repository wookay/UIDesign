//
//  inspectable.swift
//  UIDesign
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

struct Corner {
    var type: CornerType
    var point: CGPoint
    var label_frame: CGRect
}

enum CornerType: Int {
    case topleft = 1
    case topright
    case bottomleft
    case bottomright
    
    static let cases: [CornerType] = [.topleft, .topright, .bottomleft, .bottomright]
}

func cornerof(view: WView, type: CornerType) -> Corner {
    let size = view.frame.size
    var point = view.frame.origin
    var label_origin = CGPointZero
    let lsize = default_corner_label_size
    switch type {
    case .topleft:
        break
    case .topright:
        point.x += size.width
        label_origin = CGPointMake(size.width - lsize.width, 0)
    case .bottomleft:
        point.y += size.height
        label_origin = CGPointMake(0, size.height - lsize.height)
    case .bottomright:
        point.x += size.width
        point.y += size.height
        label_origin = CGPointMake(size.width - lsize.width, size.height - lsize.height)
    }
    return Corner(type: type, point: point, label_frame: CGRect(origin: label_origin, size: lsize))
}

public class WInspected {
    let inspect: WView
    let source: WView

    public init(inspect: WView, source: WView) {
        self.inspect = inspect
        self.source = source
    }
    
    public func update() {
        for sub in self.inspect.subviews {
            switch sub {
            case let label as WLabel:
                if let type = CornerType(rawValue: label.tag) {
                    let corner = cornerof(self.source, type: type)
                    label.text = String(corner.point)
                }
            default:
                break
            }
        }
    }
}


public func inspectable(view: WView) -> WInspected {
    let inspect = view.design(realign: false) { ui in
        let corners: [Corner] = CornerType.cases.map{ type in cornerof(view, type: type) }
        for corner in corners {
            let label = ui.add_label(String(corner.point))
            label.backgroundColor = default_corner_label_backgroundColor
            label.font = default_corner_label_font
            label.frame = corner.label_frame
            label.tag = corner.type.rawValue
        }
    }
    if let color = default_inspectable_view_backgroundColor {
        inspect.backgroundColor = color
    }
    return WInspected(inspect: inspect, source: view)
}
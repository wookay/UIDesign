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

enum CornerType {
    case topleft
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

public func inspectable(view: WView) {
    let inspected = view.design(realign: false) { ui in
        let corners: [Corner] = CornerType.cases.map{ type in cornerof(view, type: type) }
        for corner in corners {
            let label = ui.add_label(String(corner.point))
            label.backgroundColor = default_corner_label_backgroundColor
            label.font = default_corner_label_font
            label.frame = corner.label_frame
        }
    }
    if let color = default_inspectable_view_backgroundColor {
        inspected.backgroundColor = color
    }
}
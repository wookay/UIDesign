//
//  WDesign.swift
//  UIDesign
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

public class WDesign {
    let coordinator: WCoordinator
    
    public init(view: UIView) {
        self.coordinator = WCoordinator(view: view)
    }
}

extension WDesign {
    
    public func add_top_margin() -> WView {
        let view = WView(frame: CGRect(origin: CGPointZero, size: CGSizeMake(0, top_margin)))
        self.coordinator.add(view)
        return view
    }
    
    public func add_spacing() -> WView {
        let view = WView(frame: CGRect(origin: CGPointZero, size: CGSizeMake(0, vertical_spacing)))
        self.coordinator.add(view)
        return view
    }

    public func add_view(view: WView) -> WView {
        self.coordinator.add(view)
        return view
    }
    
    public func add_label(text: String) -> WLabel {
        let label = WLabel(frame: self.coordinator.frame(.label))
        label.textAlignment = .Center
        label.text = text
        self.coordinator.add(label)
        return label
    }
    
    public func add_button(title: String, touched: ()->Void) -> WButton {
        let button = WButton(frame: self.coordinator.frame(.button))
        if isipad {
            button.titleLabel!.font = UIFont(size: 50)
        }
        button.setTitle(title, forState: .Normal)
        button.block_setAction(touched)
        self.coordinator.add(button)
        return button
    }
}
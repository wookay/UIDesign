//
//  WViewController.swift
//  UIDesign
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

extension UIViewController {
    public func design(block: (WDesign)->Void) -> WView {
        let d = WDesign(view: self.view)
        block(d)
        d.coordinator.realign()
        return d.coordinator.view
    }
}
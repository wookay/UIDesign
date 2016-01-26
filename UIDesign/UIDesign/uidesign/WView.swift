//
//  WView.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

public class WView: UIView, WPosition {
    public var relative: WRelative? = nil
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = default_view_backgroundColor
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}

extension WView {
    public func design(realign realign: Bool = true, block: (WDesign)->Void) -> WView {
        let d = WDesign()
        d.coordinator.view = self
        block(d)
        if realign {
            d.coordinator.realign()
        }
        return self
    }
}
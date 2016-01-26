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

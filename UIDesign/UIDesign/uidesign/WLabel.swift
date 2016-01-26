//
//  WLabel.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

public class WLabel: UILabel, WPosition {
    public var relative: WRelative? = nil
    
    required public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = default_label_backgroundColor
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
}


//
//  font.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

extension UIFont {
    public convenience init(size: CGFloat) {
        let font: UIFont = UIFont.systemFontOfSize(size)
        self.init(name: font.fontName, size: size)!
    }
}

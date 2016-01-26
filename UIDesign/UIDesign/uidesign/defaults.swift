//
//  defaults.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

let side_spacing: CGFloat = isipad ? 20 : 5
let vertical_spacing: CGFloat = isipad ? 20 : 5
let top_margin: CGFloat = isipad ? 50 : 10

// sizes
let default_view_size   = isipad ? CGSizeMake(200, 100) : CGSizeMake(100, 50)
let default_label_size  = isipad ? CGSizeMake(200, 100) : CGSizeMake(100, 50)
let default_button_size = isipad ? CGSizeMake(200, 100) : CGSizeMake(100, 50)

// colors
let default_view_backgroundColor = UIColor(white: 0.97, alpha: 0.9)
let default_label_backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.8, alpha: 1)
let default_button_backgroundColor_normal = UIColor(white: 0.95, alpha: 1)
let default_button_backgroundColor_highlighted = UIColor(white: 0.8, alpha: 1)
let default_button_titleColor_normal: UIColor = .blackColor()
let default_button_titleColor_highlighted: UIColor = .greenColor()


// fonts
let default_label_font = UIFont(size: isipad ? 35 : 17)
let default_button_textLabel_font = UIFont(size: isipad ? 35 : 17)
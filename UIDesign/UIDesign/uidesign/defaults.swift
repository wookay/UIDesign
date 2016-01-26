//
//  defaults.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit


// WDesign, WCoordinator
let default_side_spacing: CGFloat = isipad ? 20 : 5
let default_vertical_spacing: CGFloat = isipad ? 20 : 5
let default_top_margin: CGFloat = isipad ? 30 : 10


// views
let default_view_size = isipad ? CGSizeMake(150, 80) : CGSizeMake(100, 50)
let default_view_backgroundColor = UIColor(white: 0.97, alpha: 0.9)


// labels
let default_label_size = isipad ? CGSizeMake(150, 80) : CGSizeMake(100, 50)
let default_label_font = UIFont(size: isipad ? 30 : 18)
let default_label_backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.8, alpha: 1)


// buttons
let default_button_size = isipad ? CGSizeMake(150, 80) : CGSizeMake(100, 50)
let default_button_backgroundColor_normal = UIColor(white: 0.95, alpha: 1)
let default_button_backgroundColor_highlighted = UIColor(white: 0.8, alpha: 1)
let default_button_titleColor_normal: UIColor = .blackColor()
let default_button_titleColor_highlighted: UIColor = .greenColor()
let default_button_textLabel_font = UIFont(size: isipad ? 30 : 18)


// inspectable
let default_corner_label_size = isipad ? CGSizeMake(100, 30) : CGSizeMake(80, 20)
let default_corner_label_font = UIFont(size: isipad ? 20 : 12)
let default_corner_label_backgroundColor = UIColor(red: 0.95, green: 0.98, blue: 0.7, alpha: 0.9)
public var default_inspectable_view_backgroundColor: UIColor? = nil
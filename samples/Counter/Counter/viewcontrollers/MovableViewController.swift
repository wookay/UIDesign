//
//  MovableViewController.swift
//  Counter
//
//  Created by wookyoung on 1/27/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit
import UIDesign

class MovableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let counter = design { ui in
            let label = ui.add_label("")
            var n = 0 {
                didSet {
                    label.text = String(n)
                }
            }
            let up = ui.add_button("up") { n += 1 }
            ui.add_button("down") { n -= 1 }
            move(label, to: up.rightside)
            n = 0
        }

        design { ui in
            ui.add_spacing(60)
            ui.add_view(counter)
        }

        default_inspectable_view_backgroundColor = .cyanColor()
        let inspected = inspectable(counter)

        movable(counter) {
            inspected.update()
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//
//  ViewController.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit
import UIDesign

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        design { ui in
            ui.add_spacing(60)
            
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
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
        
        let stack = design { ui in
            let label = ui.add_label("")
            var n = 0 {
                didSet {
                    label.text = String(n)
                }
            }
            let push = ui.add_button("push") { n += 1 }
            move(label, to: push.rightside)
            n = 0
        }
        
        design { ui in
            ui.add_spacing()
            ui.add_view(counter)
            ui.add_spacing()
            ui.add_view(stack)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
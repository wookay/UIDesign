//
//  SubViewController.swift
//  Counter
//
//  Created by wookyoung on 1/27/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit
import UIDesign

class SubViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = design { ui in
            let label = ui.add_label("")
            var n = 0 {
                didSet {
                    label.text = String(n)
                }
            }
            
            let up = ui.add_button("up") { n += 1 }
            ui.add_button("down") { n -= 1 }
            move(label, to: up.upper)
            
            n = 0
        }
    
        let b = design { ui in
            let label = ui.add_label("")
            var n = 0 {
                didSet {
                    label.text = String(n)
                }
            }
            
            ui.add_button("up") { n += 1 }
            let down = ui.add_button("down") { n -= 1 }
            move(label, to: down.upper)
            
            n = 0
        }
        
        design { ui in
            ui.add_spacing(60)
            
            ui.add_view(a)
            ui.add_view(b)
            
            move(b, to: a.rightside)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//
//  ExchangeSubviewController.swift
//  Counter
//
//  Created by wookyoung on 1/27/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit
import UIDesign

class ExchangeSubviewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var A: WLabel?
        var B: WLabel?
        
        let labels = design { ui in
        }
        
        labels.design { ui in
            ui.add_spacing(100)
            
            ui.add_button("A to B.lower") {
                move(A!, to: B!.lower)
                labels.realign()
            }
            
            ui.add_button("A to B.upper") {
                move(A!, to: B!.upper)
                labels.realign()
            }
            
            ui.add_spacing(60)

            ui.add_label("-")
            A = ui.add_label("A")
            B = ui.add_label("B")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
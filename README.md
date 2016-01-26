UIDesign
========

  [![Build Status](https://api.travis-ci.org/wookay/UIDesign.svg?branch=master)](https://travis-ci.org/wookay/UIDesign)



```sh
$ open samples/Counter/Counter.xcworkspace
```

```swift
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
}
```

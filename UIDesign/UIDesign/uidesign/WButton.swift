//
//  WButton.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

public class WButton: UIButton, WPosition {
    public var relative: WRelative? = nil
    
    required public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(.blackColor(), forState: .Normal)
        self.setTitleColor(.greenColor(), forState: .Highlighted)
        self.backgroundColor = default_button_backgroundColor
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override public var highlighted: Bool {
        didSet {
            backgroundColor = highlighted ? default_button_highlightedColor : default_button_backgroundColor
        }
    }
}


var ActionBlockKey: UInt8 = 0

typealias BlockButtonActionBlock = () -> Void
class ActionBlockWrapper : NSObject {
    var block : BlockButtonActionBlock
    init(block: BlockButtonActionBlock) {
        self.block = block
    }
}

extension WButton {
    func block_setAction(block: BlockButtonActionBlock) {
        objc_setAssociatedObject(self, &ActionBlockKey, ActionBlockWrapper(block: block), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: "block_handleAction:", forControlEvents: .TouchUpInside)
    }
    
    func block_handleAction(sender: UIButton) {
        let wrapper = objc_getAssociatedObject(self, &ActionBlockKey) as! ActionBlockWrapper
        wrapper.block()
    }
}
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
        self.backgroundColor = default_button_backgroundColor_normal
        self.titleLabel!.font = default_button_textLabel_font
        self.setTitleColor(default_button_titleColor_normal, forState: .Normal)
        self.setTitleColor(default_button_titleColor_highlighted, forState: .Highlighted)
        self.titleLabel!.adjustsFontSizeToFitWidth = true
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override public var highlighted: Bool {
        didSet {
            backgroundColor = highlighted ? default_button_backgroundColor_highlighted : default_button_backgroundColor_normal
        }
    }
}



// answered Nov 1 '15 at 11:44
// http://stackoverflow.com/questions/24962151/hooking-up-uibutton-to-closure-swift-target-action/33461778#33461778

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
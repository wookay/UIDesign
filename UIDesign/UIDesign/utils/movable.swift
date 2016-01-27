//
//  movable.swift
//  UIDesign
//
//  Created by wookyoung on 1/27/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

public enum TouchType {
    case began
    case moved
    case ended
}

public class WMovable: WView {
    var top: UIView? = nil
    var source: UIView? = nil
    var moved: (()->Void)? = nil
    
    let touched: (UIView, TouchType, CGPoint, CGPoint)->Void = { source, type, loc, delta in
        if isipad {
            source.frame = CGRectOffset(source.frame, delta.x/2, delta.y/2)
        } else {
            source.frame = CGRectOffset(source.frame, delta.x, delta.y)
        }
    }

    required public init(top: UIView, source: UIView, moved: ()->Void) {
        super.init(frame: top.frame)
        self.backgroundColor = .clearColor()
        self.top = top
        self.source = source
        self.moved = moved
    }
    
    required public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func delta_location(touch: UITouch) -> CGPoint {
        let prev = touch.previousLocationInView(self)
        let loc = touch.locationInView(self)
        return CGPointMake(loc.x - prev.x, loc.y - prev.y)
    }

    override public func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        return CGRectContainsPoint(self.source!.frame, point) ? self : nil
    }

    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let loc = touch.locationInView(self)

        if CGRectContainsPoint(self.source!.frame, loc) {
            self.touched(self.source!, .began, loc, delta_location(touch))
            self.moved?()
        }
    }
    
    override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        for coalescedTouch in event!.coalescedTouchesForTouch(touch)! {
            let loc = coalescedTouch.locationInView(self)
            if CGRectContainsPoint(self.source!.frame, loc) {
                self.touched(self.source!, .moved, loc, delta_location(touch))
                self.moved?()
            }
        }
    }
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let loc = touch.locationInView(self)
        if CGRectContainsPoint(self.source!.frame, loc) {
            self.touched(self.source!, .ended, loc, delta_location(touch))
            self.moved?()
        }
    }
    
    override public func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        touchesEnded(touches!, withEvent: event)
    }
}


extension UIViewController {
    public func movable(source: WView, moved: (()->Void) = { _ in }) -> WMovable {
        let top = self.view
        let m = WMovable(top: top, source: source, moved: moved)
        top.addSubview(m)
        return m
    }
}
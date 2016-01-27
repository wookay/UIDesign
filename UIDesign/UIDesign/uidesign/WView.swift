//
//  WView.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

public class WView: UIView, WPosition {
    public var relative: WRelative? = nil
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = default_view_backgroundColor
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}

extension WView {
    public func realign() {
        let source = self
        
        var bottom: CGPoint = self.frame.origin
        
        var origin = CGPointMake(default_side_spacing, default_side_spacing)
        for subview: UIView in source.subviews {
            switch subview {
            case let w as WPosition:
                if nil == w.relative {
                    let size = subview.frame.size
                    subview.frame = CGRect(origin: origin, size: size)
                    origin.y += size.height + default_vertical_spacing
                    bottom.x = max(bottom.x, origin.x + size.width)
                    bottom.y = max(bottom.y, origin.y)
                }
            default:
                break
            }
        }
        
        for subview: UIView in source.subviews {
            switch subview {
            case let w as WPosition:
                if let relative = w.relative {
                    var origin = relative.source.frame.origin
                    switch relative.side {
                    case .rightside:
                        origin.x += relative.source.frame.width + default_side_spacing
                    case .upper:
                        let subview_frame = subview.frame
                        UIView.animateWithDuration(0.2,
                            animations: {
                                subview.frame = CGRectOffset(subview_frame, 0, subview_frame.size.height/2)
                                subview.superview!.staySubview(lower: relative.source, upper: subview)
                            }, completion: { finished in
                                if finished {
                                    subview.frame = subview_frame
                                }
                            }
                        )
                    case .lower:
                        let subview_frame = subview.frame
                        UIView.animateWithDuration(0.3,
                            animations: {
                                subview.superview!.staySubview(lower: subview, upper: relative.source)
                                subview.frame = CGRectOffset(subview_frame, 0, subview_frame.size.height/2)
                            }, completion: { finished in
                                if finished {
                                    subview.frame = subview_frame
                                }
                            }
                        )
                    default:
                        origin.y += relative.source.frame.height + default_side_spacing
                    }
                    let size = subview.frame.size
                    subview.frame = CGRect(origin: origin, size: size)
                    bottom.x = max(bottom.x, origin.x + size.width)
                    bottom.y = max(bottom.y, origin.y)
                }
            default:
                break
            }
        }
        
        source.frame = CGRect(origin: CGPointMake(default_side_spacing, default_side_spacing),
            size: CGSizeMake(bottom.x + default_side_spacing, bottom.y))
    }
    
    public func design(realign realign: Bool = true, block: (WDesign)->Void) -> WView {
        let d = WDesign()
        d.coordinator.source = self
        block(d)
        if realign {
            d.coordinator.realign()
        }
        return self
    }
}
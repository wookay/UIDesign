//
//  device.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit

public let isipad: Bool = UIDevice.currentDevice().userInterfaceIdiom == .Pad

public let isSim: Bool = {
    var sim = false
    #if arch(i386) || arch(x86_64)
        sim = true
    #endif
    return sim
}()
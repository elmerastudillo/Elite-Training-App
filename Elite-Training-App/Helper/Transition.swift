//
//  File.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 10/15/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import UIKit

struct Transition
{
    static func fadeTransition() -> CATransition
    {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        return transition
    }
}

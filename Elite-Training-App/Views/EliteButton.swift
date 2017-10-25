//
//  EliteButton.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/19/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class EliteButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let borderAlpha : CGFloat = 0.7
        let cornderRadius : CGFloat = 5.0
        self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 0)
        self.layer.cornerRadius = cornderRadius
        self.layer.masksToBounds = true
    }
}

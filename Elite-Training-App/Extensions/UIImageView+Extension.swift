//
//  File.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/26/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

extension UIImageView
{
    func roundedImage()
    {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}

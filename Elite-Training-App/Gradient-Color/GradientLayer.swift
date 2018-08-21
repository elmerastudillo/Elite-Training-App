//
//  GradientLayer.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/26/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import UIKit

struct GradientLayer
{
    static func colorSet() -> [CGColor]
    {
        // Hex: 3023AE
        let colorOne = UIColor(red: 48.0/255.0, green: 35/255.0, blue: 174/255.0, alpha: 1.0)
        // Hex: C86DD7
        let colorTwo = UIColor(red: 200/255.0, green: 109/255.0, blue: 214/255.0, alpha: 1.0)
        let colorSet : [CGColor] = [colorOne.cgColor, colorTwo.cgColor]
        return colorSet
    }
    
    static func opaqueColorSet() -> [CGColor]
    {
        let colorOne = UIColor(red: 48.0/255.0, green: 35/255.0, blue: 174/255.0, alpha: 0.8)
        // Hex: C86DD7
        let colorTwo = UIColor(red: 200/255.0, green: 109/255.0, blue: 214/255.0, alpha: 0.8)
        let colorSet : [CGColor] = [colorOne.cgColor, colorTwo.cgColor]
        return colorSet
    }
    
    // Views
    // Gradient Layer
    static func gradientBorder(bounds: CGRect) -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorSet()
        gradientLayer.frame = bounds
        gradientLayer.name = "BorderLayer"
        //Make color gradient start from left to right
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let shape = CAShapeLayer()
        shape.lineWidth = 7
        shape.path = UIBezierPath(rect: bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
       // shape.cornerRadius = 5
        gradientLayer.mask = shape
        return gradientLayer
    }
    
    // Gradient border with transparent fill
    static func gradient(bounds: CGRect) -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "GradientLayer"
        gradientLayer.colors = colorSet()
        gradientLayer.frame = bounds
        //Make color gradient start from left to right
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    
        return gradientLayer
    }
    
    // Gradient border with transparent fill
    static func gradientOpaque(bounds: CGRect) -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "GradientLayer"
        gradientLayer.colors = opaqueColorSet()
        gradientLayer.frame = bounds
        //Make color gradient start from left to right
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        return gradientLayer
    }
}




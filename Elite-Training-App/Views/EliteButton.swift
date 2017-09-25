//
//  EliteButton.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/19/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

public class EliteButton: UIButton {
    
    // Delegate for EliteButton
    //weak var delegate: EliteButtonDelegate?
    
    private var isSetup : Bool = false
    private var notChange : Bool = false
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        //layoutGradientButtonLayer()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        //TODO: Code for our button
    }
    
//    private func buttonTouchedIn()
//    {
//        delegate?.buttonIn()
//        
//    }
//    
//    private func buttonTouchedOut()
//    {
//        delegate?.buttonOut()
//    }
    
    override public var isSelected: Bool
    {
        didSet {
            layoutGradientBorderLayer()
        }
    }
    
    override public var isEnabled: Bool
    {
        didSet{
            layoutGradientBorderLayer()
        }
    }
    
    override public var isHighlighted: Bool
    {
        didSet{
            layoutGradientBorderLayer()
        }
    }
    
    // MARK: - When button is pressed
    private func layoutGradientButtonLayer()
    {
        let gradientLayer = CAGradientLayer()
        let color1 = UIColor()
        let color2 = UIColor()
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK: - When button is not pressed
    private func layoutGradientBorderLayer()
    {
        let gradientLayer = CAGradientLayer()
        let color1 = UIColor()
        let color2 = UIColor()
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  EliteButton.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/19/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class EliteButton: UIButton {
    
    // Delegate for EliteButton
    //weak var delegate: EliteButtonDelegate?
    
    private var isSetup : Bool = false
    private var notChange : Bool = false
    var myValue : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //let bthWidth = 300
        //let btnHeight = 60

        //self.layer.cornerRadius = 10.0
        //self.clipsToBounds = true
        
//        self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 0)
//        self.titleLabel?.textColor = UIColor.white
//        
//        self.addTarget(self, action: #selector(touchDown(sender:)), for: .touchDown);
//        self.addTarget(self, action: #selector(touchDownAgain(sender:)), for: .touchDownRepeat)
        
//        self.layer.addSublayer(GradientLayer.gradientBorder(bounds: self.bounds))
        
        
        
        self.backgroundColor = UIColor.gray
        self.titleLabel?.textColor = UIColor.white
    }
    
    //target functions
//    @objc func touchDown(sender:UIButton)
//    {
//        self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
////        zeroButton.backgroundColor = UIColor.blueColor()
//        self.layer.sublayers?[0].removeFromSuperlayer()
//        self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
//    }
//
//    @objc func touchDownAgain(sender:UIButton)
//    {
//        self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 1)
//        self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
////        zeroButton.backgroundColor = UIColor.whiteColor()
    
//    override var isHighlighted: Bool {
//        get {
//            return super.isHighlighted
//        }
//        set {
//            //Checking to see the state of the button. If selected or unselected
//            if(newValue){
//                print(newValue)
//                self.isSelected = !self.isSelected
//                self.titleLabel?.textColor = UIColor.white
//            }
//
//            super.isHighlighted = newValue
//        }
//    }
//
//    override var isSelected: Bool{
//
//    }
//    override var isSelected: Bool {
//        willSet(newValue) {
//            super.isSelected = newValue;
//            print(newValue)
//            // If newValue is true change the gradient colorway
//            if isSelected {
//                //self.layer.sublayers?[0].removeFromSuperlayer()
//                self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
//                //self.layer.insertSubLayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
//                self.setNeedsDisplay()
////                self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
//                //layer.borderWidth = 5.0
//            } else {
//                self.layer.removeAllAnimations()
//                self.backgroundColor = UIColor.gray
//                self.titleLabel?.textColor = UIColor.white
//               
//            }
//        }
//    }
//    
    //self.layer.removeFromSuperlayer()
//    self.titleLabel?.textColor = UIColor.black
    //                view.layer.sublayers?[0].removeFromSuperLayer()
    //                view.layer.insertSubLayer(MyLayer, at: 0)
    //self.layer.sublayers?[0].removeFromSuperlayer()
//    self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 1)
    //self.layer.insertSubLayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
//    self.setNeedsDisplay()
    //                self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 2)
    //                self.setNeedsDisplay()
    //layer.borderWidth = 0.0
    
    
    
//    override var isHighlighted: Bool {
//        didSet {
//            switch (isHighlighted, isSelected) {
//            case (true, false):
//                self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 1)
//                layer.borderWidth = 5.0
//            case (true, true):
//                self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 1)
//                layer.borderWidth = 5.0
//            case (false, true):
//                self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 1)
//                layer.borderWidth = 5.0
//            default:
//                self.layer.borderWidth = 30
//                layer.borderWidth = 0.0
//            }
//        }
//    }
    
//    func touchUpInside(sender: UIButton!) {
//        isSelected = !isSelected
//    }
    
//    override var isSelected: Bool {
//        didSet {
//            //isSelected = true
//            adjustButtonColor()
//            print("HI")
//        }
//    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

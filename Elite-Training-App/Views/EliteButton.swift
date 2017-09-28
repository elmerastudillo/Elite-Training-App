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
        
        let bthWidth = 300
        let btnHeight = 60

        self.frame.size = CGSize(width: bthWidth, height: btnHeight)
//        self.frame.origin = CGPoint(x: (((superview?.frame.width)! / 2) - (self.frame.width / 2)), y: self.frame.origin.y)
//
        //self.layer.cornerRadius = 10.0
        //self.clipsToBounds = true
        
        self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 0)
//        [self addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchDown];
//        [self addTarget:self action:@selector(buttonDepressed) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside | UIControlEventTouchCancel]
        //self.addTarget(self, action: #selector(buttonPressed), for: UIControlEvents.touchDown)
        //self.addTarget(self, action: #selector(buttonDepressed), for:)
            //|| UIControlEvents.touchUpOutside | UIControlEvents.touchCancel)
    }
    
//    @IBAction func buttonPressed(sender: EliteButton)
//    {
//        sender.isSelected  = !sender.isSelected
//
//        if (sender.isSelected)
//        {
//            NSLog(" Not Selected");
//            self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
//        }
//        else
//        {
//            self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 0)
//            NSLog(" Selected");
//        }
//
//    }
    
    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            if(newValue){
                self.isSelected = !self.isSelected
            }

            super.isHighlighted = newValue
        }
    }

    override var isSelected: Bool {
        willSet(newValue) {
            super.isSelected = newValue;
            if isSelected {
                self.layer.insertSublayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
                //layer.borderWidth = 1.0
            } else {
                self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 0)
                //layer.borderWidth = 0.0
            }
        }
    }
    
//    override var isSelected: Bool {
//        didSet {
//            //isSelected = true
//            adjustButtonColor()
//            print("HI")
//        }
//    }
    
    func adjustButtonColor() {
        if  isSelected {
            
        } else {
            self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 0)
        }
    }
    
    
//    @IBAction func buttonDepressed(sender: EliteButton)
//    {
//        self.layer.insertSublayer(GradientLayer.gradientBorder(bounds: self.bounds), at: 0)
//    }
    
    func colorSet() -> [CGColor]
    {
        // Hex: 3023AE
        let colorOne = UIColor(red: 48.0/255.0, green: 35/255.0, blue: 174/255.0, alpha: 1.0)
        // Hex: C86DD7
        let colorTwo = UIColor(red: 200/255.0, green: 109/255.0, blue: 214/255.0, alpha: 1.0)
        let colorSet : [CGColor] = [colorOne.cgColor, colorTwo.cgColor]
        return colorSet
    }
    
    
//    override var isSelected: Bool {
//        willSet {
//            print("changing from \(isSelected) to \(newValue)")
//             self.layer.addSublayer(GradientLayer.gradient(bounds: self.bounds))
//        }
//
//        didSet {
//            print("changed from \(oldValue) to \(isSelected)")
//        }
//    }
//
//    override public var isEnabled: Bool
//    {
//        didSet{
//           
//        }
//    }
//    
//    override public var isHighlighted: Bool
//    {
//        didSet{
//            
//        }
//    }
    
//    static func createButtonWithGradient()
//    {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame =  CGRect(origin: CGPoint.zero, size: self.frame)
//        gradientLayer.colors = colorSet()
//        gradientLayer.frame =
//        //Make color gradient start from left to right
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//        //        return gradientLayer
//        
//        //        let gradient = CAGradientLayer()
//        
//        //gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
//        
//        let shape = CAShapeLayer()
//        shape.lineWidth = 2
//        shape.path = UIBezierPath(rect: self.bounds).cgPath
//        shape.strokeColor = UIColor.black.cgColor
//        shape.fillColor = UIColor.clear.cgColor
//        gradientLayer.mask = shape
//        
//        button.layer.addSublayer(gradientLayer)
//        return button
//    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

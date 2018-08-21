//
//  TrainerInfoSpecVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class TrainerInfoSpecVC: UIViewController {
    
    var trainingFocusPref = [String: String]()
    
    @IBOutlet weak var functionalMovementButton: UIButton!
    @IBOutlet weak var strengthAndCondButton: UIButton!
    @IBOutlet weak var weightLossButton: UIButton!
    @IBOutlet weak var rehabilitationButton: UIButton!
    @IBOutlet weak var olympicAndPLButton: UIButton!
    @IBOutlet weak var obstacleCourseButton: UIButton!
    @IBOutlet weak var correctiveButton: UIButton!
    @IBOutlet weak var leanAndToneButton: UIButton!
    @IBOutlet weak var nutrtionalGuidButton: UIButton!
    @IBOutlet weak var balanceAndStabButton: UIButton!
    @IBOutlet weak var coreStrengthButton: UIButton!
    @IBOutlet weak var smallGroupButton: UIButton!
    @IBOutlet weak var natalButton: UIButton!
    @IBOutlet weak var runningAndEndButton: UIButton!
    @IBOutlet weak var doneButtonPressed: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButtonPressed.layer.insertSublayer(GradientLayer.gradient(bounds: doneButtonPressed.bounds), at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        for (_ , value) in trainingFocusPref
        {
            let focusObj = Focus(focus: value)
            TrainerService.updateTrainerFocus(forUID: Trainer.current.uid ,focus: focusObj)
        }
            self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
            self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func eliteButtonPressed(_ sender: UIButton) {
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func focusButtonPressed(_ sender: UIButton)
    {
        sender.isSelected = !sender.isSelected
        if sender.isSelected
        {
            guard let focus = sender.titleLabel?.text?.lowercased() else {return}
            trainingFocusPref[focus] = focus
            sender.setTitleColor(UIColor.black, for: .selected)
            sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
        }
        else
        {
            guard let focus = sender.titleLabel?.text?.lowercased() else {return}
            trainingFocusPref.removeValue(forKey: focus)
            guard let layers = sender.layer.sublayers else {return}
            for layer in layers
            {
                if layer.name == "GradientLayer"
                {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
    
}

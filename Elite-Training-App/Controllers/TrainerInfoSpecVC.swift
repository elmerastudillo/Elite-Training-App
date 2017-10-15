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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            navigationController?.popViewController(animated: true)
    }
    
    @IBAction func eliteButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func focusButtonPressed(_ sender: UIButton)
    {
        sender.isSelected = !sender.isSelected
        if sender.isSelected
        {
            guard let focus = sender.titleLabel?.text?.lowercased() else {return}
            trainingFocusPref[focus] = focus
            
        }
        else
        {
            guard let focus = sender.titleLabel?.text?.lowercased() else {return}
            trainingFocusPref.removeValue(forKey: focus)
            
            
        }
    }
    
    
}

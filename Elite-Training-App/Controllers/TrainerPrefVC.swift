//
//  TrainerPrefVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/19/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class TrainerPrefVC: UIViewController {

    var genderPreference : String?
    var trainingFocusPref: String?
    
    // Passing User Info
    var firstname : String?
    var lastname : String?
    var emailAdress : String?
    
    var newMember: NewMember?
    
   
    // MARK: - Button Outlets
     @IBOutlet weak var nextButton: UIButton!
    // MARK: - Gender Preference
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var notApplicableButton: UIButton!
    
    // MARK: - Focus Preference
    @IBOutlet weak var functionalMovementButton: UIButton!
    @IBOutlet weak var strengthAndCondButton: UIButton!
    @IBOutlet weak var weightLossButton: UIButton!
    @IBOutlet weak var rehabilitationButton: UIButton!
    @IBOutlet weak var olympicAndPLButton: UIButton!
    @IBOutlet weak var obstacleCourseButton: UIButton!
    @IBOutlet weak var correctiveButton: UIButton!
    @IBOutlet weak var leanAndToneButton: UIButton!
    @IBOutlet weak var nutritionalGuidButton: UIButton!
    @IBOutlet weak var balanceAndStabiButton: UIButton!
    @IBOutlet weak var coreStrengthButton: UIButton!
    @IBOutlet weak var smallGroupButton: UIButton!
    @IBOutlet weak var natalButton: UIButton!
    @IBOutlet weak var runningAndEndButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.addSublayer(GradientLayer.gradient(bounds: nextButton.bounds))
        nextButton.layer.cornerRadius = 5.0
        nextButton.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func eliteButtonPressed(_ sender: UIButton) {
        if Trainer.loggedIn == true
        {
            let storyboard = UIStoryboard.init(name: "TrainerProfile", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "TrainerProfileVC")
            self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
            self.navigationController?.pushViewController(loginVC, animated: false)
        }
        else
        {
            let storyboard = UIStoryboard.init(name: "TrainerLogin", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "TrainerLoginVC")
            self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
            self.navigationController?.pushViewController(loginVC, animated: false)
        }
        
    }

    @IBAction func nexButtonPressed(_ sender: UIButton) {
        guard let gender = genderPreference, let focus = trainingFocusPref
            else { return alertController() }
        print(gender + focus)
        
        let storyboard = UIStoryboard.init(name: "NewMember", bundle: nil)
        let hoursOfWorkoutVC = storyboard.instantiateViewController(withIdentifier: "HoursOfWorkoutVC") as! HoursOfWorkoutVC
        newMember?.genderPreference = gender
        newMember?.trainingPreference = focus
        hoursOfWorkoutVC.newMember = newMember
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.pushViewController(hoursOfWorkoutVC, animated: false)
    }
    
    @IBAction func genderButtonPressed(_ sender: UIButton)
    {
        let buttonArray : [UIButton] = [maleButton, femaleButton, notApplicableButton]
        
        for button in buttonArray
        {
            if button.tag == sender.tag
            {
                button.isSelected = true
                button.layer.insertSublayer(GradientLayer.gradient(bounds: button.bounds), at: 0)
                button.setNeedsDisplay()
                genderPreference = (button.titleLabel?.text?.lowercased())!
            }
            else
            {
                if button.isSelected == true
                {
                    button.isSelected = false
                    for layer in button.layer.sublayers!
                    {
                        if layer.name == "GradientLayer"
                        {
                            layer.removeFromSuperlayer()
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func trainerFocusButtonPressed(_ sender: UIButton)
    {
        let buttonArray : [UIButton] = [functionalMovementButton, strengthAndCondButton, weightLossButton, rehabilitationButton, olympicAndPLButton, obstacleCourseButton, correctiveButton, leanAndToneButton, nutritionalGuidButton, balanceAndStabiButton, coreStrengthButton, smallGroupButton, natalButton, runningAndEndButton]
        
        for button in buttonArray
        {
            if button.tag == sender.tag
            {
                button.isSelected = true
                
                //self.layer.sublayers?[0].removeFromSuperlayer()
                button.layer.insertSublayer(GradientLayer.gradient(bounds: button.bounds), at: 0)
                //self.layer.insertSubLayer(GradientLayer.gradient(bounds: self.bounds), at: 0)
                button.setNeedsDisplay()
                //                self.layer.insertSublayer(Grad
                trainingFocusPref = (button.titleLabel?.text?.lowercased())!
            }
            else
            {
                if button.isSelected == true
                {
                    button.isSelected = false
                    guard let layers = button.layer.sublayers else {return}
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
    }
    
    // MARK: - Helper Functions
    func alertController()
    {
        let alertController = UIAlertController(title: "Message", message: "You must select a gender and focus", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

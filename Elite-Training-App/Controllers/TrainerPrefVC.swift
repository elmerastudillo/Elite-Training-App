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
    
   
    // MARK: - Button Outlets
     @IBOutlet weak var nextButton: EliteButton!
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func eliteButtonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "NewMember", bundle: nil)
        let workoutVC = storyboard.instantiateViewController(withIdentifier: "WorkoutVC")
        navigationController?.pushViewController(workoutVC, animated: true)
        
    }

    @IBAction func nexButtonPressed(_ sender: UIButton) {
        guard let gender = genderPreference, let focus = trainingFocusPref
            else { return alertController() }
        print(gender + focus)
        
        let storyboard = UIStoryboard.init(name: "NewMember", bundle: nil)
        let hoursOfWorkoutVC = storyboard.instantiateViewController(withIdentifier: "HoursOfWorkoutVC")
        navigationController?.pushViewController(hoursOfWorkoutVC, animated: true)
        
    }
    
    @IBAction func genderButtonPressed(_ sender: UIButton)
    {
        let buttonArray : [UIButton] = [maleButton, femaleButton, notApplicableButton]
        
        for button in buttonArray
        {
            if button.tag == sender.tag
            {
                button.isSelected = true
                //button.isSelected = !button.isSelected
                genderPreference = (button.titleLabel?.text?.lowercased())!
            }
            else
            {
                button.isSelected = false
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
                trainingFocusPref = (button.titleLabel?.text?.lowercased())!
            }
            else
            {
                button.isSelected = false
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

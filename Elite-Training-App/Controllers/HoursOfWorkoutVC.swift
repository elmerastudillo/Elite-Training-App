//
//  HoursOfWorkoutVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class HoursOfWorkoutVC: UIViewController {

    // MARK: - Button Outlets
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var lessThenThreeButton: EliteButton!
    @IBOutlet weak var lessThenFiveButton: EliteButton!
    @IBOutlet weak var lessThenSevenButton: EliteButton!
    @IBOutlet weak var lessThenTenButton: EliteButton!
    
    // Passing User Info
    var genderPreference : String?
    var trainingFocusPref: String?
    var firstname : String?
    var lastname : String?
    var emailAddress : String?
    
    // Hours per week
    var hoursPerWeek : String?
    
    var newMember : NewMember?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextButton.layer.addSublayer(GradientLayer.gradient(bounds: nextButton.bounds))
        nextButton.layer.cornerRadius = 5.0
        nextButton.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - IBActions
    
    @IBAction func hoursButtonpressed(_ sender: UIButton)
    {
        let buttons : [UIButton] = [lessThenThreeButton, lessThenFiveButton, lessThenSevenButton, lessThenTenButton]
        
        for button in buttons
        {
            if button.tag == sender.tag
            {
                button.isSelected = true
                
                button.layer.insertSublayer(GradientLayer.gradient(bounds: button.bounds), at: 0)
                button.setNeedsDisplay()
                hoursPerWeek = (button.titleLabel?.text?.lowercased())!
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
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard let hoursPerWeek = self.hoursPerWeek
            else { return }
        self.newMember?.hoursPerWeek = hoursPerWeek
        
//        print(firstname + lastname + emailAddress + genderPreference + trainingFocusPref + hoursPerWeek)
        guard let member = self.newMember else { return }
        print(member)
        
        NewMemberService.createNewMember(firstName: member.firstName, lastName: member.lastName, email: member.email, genderPreference: member.genderPreference, trainingPreference: member.trainingPreference, hoursPerWeek: member.hoursPerWeek)
        let storyboard = UIStoryboard.init(name: "TrainerSelect", bundle: nil)
        let trainerSelVC = storyboard.instantiateViewController(withIdentifier: "TrainerSelectVC") as! TrainerSelectVC
        trainerSelVC.newMember = member
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.pushViewController(trainerSelVC, animated: false)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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
    
    @IBOutlet weak var lessThenThreeButton: UIButton!
    @IBOutlet weak var lessThenFiveButton: UIButton!
    @IBOutlet weak var lessThenSevenButton: UIButton!
    @IBOutlet weak var lessThenTenButton: UIButton!
    
    var hoursPerWeek : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            if sender.tag == button.tag
            {
                button.isSelected = true
                hoursPerWeek = sender.titleLabel?.text?.lowercased()
            }
            else
            {
                button.isSelected = false
            }
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard let hoursPerWeek = self.hoursPerWeek else { return }
        let storyboard = UIStoryboard.init(name: "NMSchedule", bundle: nil)
        let trainerVC = storyboard.instantiateViewController(withIdentifier: "ScheduleVC")
        navigationController?.pushViewController(trainerVC, animated: true)
    }
    
    @IBAction func eliteButtonPressed(_ sender: UIButton) {
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

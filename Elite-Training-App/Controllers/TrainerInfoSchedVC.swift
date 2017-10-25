//
//  TrainerInfoSchedVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

enum Day : String
{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

class TrainerInfoSchedVC: UIViewController {
    
//    var timeSlotArr: [TimeSlot]?
    var timeSlotDictionary = [Int: TimeSlot]()
    var timeSlotButtons: [UIButton]?
    var buttonIsSelected = false
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.insertSublayer(GradientLayer.gradient(bounds: doneButton.bounds), at: 0)
        doneButton.layer.cornerRadius = 5.0
        doneButton.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func eliteButtonPressed(_ sender: UIButton) {
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        for (_, value) in timeSlotDictionary
        {
            TrainerService.updateTrainerSchedule(forUID: Trainer.current.uid, timeSlot: value)
        }
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func timeSlotPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            switch sender.tag
            {
            case 100..<200:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "sunday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 200..<300:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "monday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 300..<400:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "tuesday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 400..<500:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "wednesday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 500..<600:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "thursday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 600..<700:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "friday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            default:
                break
            }
        }
        else
        {
            guard let layers = sender.layer.sublayers else {return}
            for layer in layers
            {
                if layer.name == "GradientLayer"
                {
                    layer.removeFromSuperlayer()
                }
            }
            timeSlotDictionary.removeValue(forKey: sender.tag)
        }
        
        print(timeSlotDictionary)
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

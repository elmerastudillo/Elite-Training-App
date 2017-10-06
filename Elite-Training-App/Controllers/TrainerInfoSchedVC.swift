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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        for (_, value) in timeSlotDictionary
        {
            TrainerService.updateTrainerSchedule(forUID: Trainer.current.uid, timeSlot: value)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func timeSlotPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            switch sender.tag
            {
            case 100..<200:
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "sunday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 200..<300:
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "monday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 300..<400:
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "tuesday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 400..<500:
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "wednesday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 500..<600:
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "thursday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 600..<700:
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "friday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            default:
                break
            }
        }
        else
        {
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

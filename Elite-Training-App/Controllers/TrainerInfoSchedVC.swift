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
    var buttonIsSelected = false
    @IBOutlet weak var doneButton: UIButton!
    var eliteButtonArray : [EliteButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.insertSublayer(GradientLayer.gradient(bounds: doneButton.bounds), at: 0)
        doneButton.layer.cornerRadius = 5.0
        doneButton.layer.masksToBounds = true
        
        self.lookForButton(view: self.view)
        
        NewMemberService.fetchSchedule(uid: Trainer.current.uid) { (timeslots) in
            print(timeslots)
            print(self.eliteButtonArray)
            if !timeslots.isEmpty
            {
                for button in self.eliteButtonArray
                {
                    for slot in timeslots
                    {
                        if button.tag == Int(slot.key)
                        {
                            DispatchQueue.main.async {
                                button.layer.insertSublayer(GradientLayer.gradient(bounds: button.bounds), at: 0)
                                button.isSelected = true
                                button.setTitleColor(UIColor.black, for: .selected)
                                self.timeSlotDictionary[button.tag] = slot
                            }
                        }
                    }
                }
            }
        }
        
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
        TrainerService.removeTrainerSchedule(forUID: Trainer.current.uid)
        
        for (key , value) in timeSlotDictionary
        {
            TrainerService.updateTrainerSchedule(forUID: Trainer.current.uid, timeSlot: value, buttonTag: key)
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
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "sunday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 200..<300:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "monday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 300..<400:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "tuesday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 400..<500:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "wednesday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 500..<600:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "thursday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 600..<700:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "friday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 700..<800:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "saturday", time: timeText, key: String(describing:sender.tag))
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
    
    // Using recursion to look inside nested views
    func lookForButton(view: UIView)
    {
        let subviews = view.subviews
        if subviews.count == 0 { return }
        for v in subviews
        {
            if v is UIButton && v.tag != 0
            {
                let button = v as! EliteButton
                self.eliteButtonArray.append(button)
            }
            else
            {
                print(v)
                lookForButton(view: v)
            }
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

//
//  TrainerTimeSlotVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 10/4/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class TrainerTimeSlotVC: UIViewController {
    
    var trainer: Trainer? 

    @IBOutlet weak var mondayStackView: UIStackView!
    @IBOutlet weak var tuesdayStackView: UIStackView!
    @IBOutlet weak var wednesdayStackView: UIStackView!
    @IBOutlet weak var thursdayStackView: UIStackView!
    @IBOutlet weak var fridayStackView: UIStackView!
    @IBOutlet weak var saturdayStackView: UIStackView!
    @IBOutlet weak var sundayStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewBasedOnTimeSlot()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createViewBasedOnTimeSlot()
    {
        guard let trainer = trainer else { return }
        
        NewMemberService.fetchSchedule(uid: trainer.uid) { (timeslots) in
            print(timeslots.count)
            for slot in timeslots
            {
                switch slot.dayOfTheWeek{
                case Day.monday.rawValue:
                    let slotButton = EliteButton(frame:CGRect(x: 0, y: 0, width: self.mondayStackView.frame.width, height: 20.0))
                    slotButton.tintColor = UIColor.white
                    slotButton.setTitle(slot.time, for: UIControlState())
                    self.mondayStackView.addArrangedSubview(slotButton)
                    print(self.mondayStackView)
                case Day.tuesday.rawValue:
                    let slotButton = EliteButton(frame:CGRect(x: 0, y: 0, width: self.tuesdayStackView.frame.width, height: 20.0))
                    slotButton.tintColor = UIColor.white
                    slotButton.setTitle(slot.time, for: UIControlState())
                    self.tuesdayStackView.addArrangedSubview(slotButton)
                case Day.wednesday.rawValue:
                    let slotButton = EliteButton(frame:CGRect(x: 0, y: 0, width: self.wednesdayStackView.frame.width, height: 20))
                    slotButton.tintColor = UIColor.white
                    slotButton.setTitle(slot.time, for: UIControlState())
                    self.wednesdayStackView.addArrangedSubview(slotButton)
                case Day.thursday.rawValue:
                    let slotButton = EliteButton(frame:CGRect(x: 0, y: 0, width: self.thursdayStackView.frame.width, height: 20))
                    slotButton.tintColor = UIColor.white
                    slotButton.setTitle(slot.time, for: UIControlState())
                    self.thursdayStackView.addArrangedSubview(slotButton)
                case Day.friday.rawValue:
                    let slotButton = EliteButton(frame:CGRect(x: 0, y: 0, width: self.fridayStackView.frame.width, height: 20))
                    slotButton.tintColor = UIColor.white
                    slotButton.setTitle(slot.time, for: UIControlState())
                    self.fridayStackView.addArrangedSubview(slotButton)
                case Day.saturday.rawValue:
                    let slotButton = EliteButton(frame:CGRect(x: 0, y: 0, width: self.saturdayStackView.frame.width, height: 20))
                    slotButton.tintColor = UIColor.white
                    slotButton.setTitle(slot.time, for: UIControlState())
                    self.saturdayStackView.addArrangedSubview(slotButton)
                case Day.sunday.rawValue:
                    let slotButton = EliteButton(frame:CGRect(x: 0, y: 0, width: self.sundayStackView.frame.width, height: 20))
                    slotButton.tintColor = UIColor.white
                    slotButton.setTitle(slot.time, for: UIControlState())
                    self.sundayStackView.addArrangedSubview(slotButton)
                default:
                    break
                }
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

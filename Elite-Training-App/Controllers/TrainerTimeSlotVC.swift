//
//  TrainerTimeSlotVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 10/4/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
//import SendGrid

class TrainerTimeSlotVC: UIViewController {
    
    var trainer: Trainer?
    var timeSlotDictionary = [Int: TimeSlot]()

    @IBOutlet weak var doneButton: UIButton!
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
        doneButton.layer.addSublayer(GradientLayer.gradient(bounds: doneButton.bounds))
        doneButton.layer.cornerRadius = 5.0
        doneButton.layer.masksToBounds = true
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
                case Day.sunday.rawValue:
                    self.createBttnTimeSlotWithStackV(stackView: self.sundayStackView, time: slot.time, tag: 100)
                case Day.monday.rawValue:
                    self.createBttnTimeSlotWithStackV(stackView: self.mondayStackView, time: slot.time, tag: 200)
                case Day.tuesday.rawValue:
                    self.createBttnTimeSlotWithStackV(stackView: self.tuesdayStackView, time: slot.time, tag: 300)
                case Day.wednesday.rawValue:
                    self.createBttnTimeSlotWithStackV(stackView: self.wednesdayStackView, time: slot.time, tag: 400)
                case Day.thursday.rawValue:
                    self.createBttnTimeSlotWithStackV(stackView: self.thursdayStackView, time: slot.time, tag: 500)
                case Day.friday.rawValue:
                    self.createBttnTimeSlotWithStackV(stackView: self.fridayStackView, time: slot.time, tag: 600)
                case Day.saturday.rawValue:
                    self.createBttnTimeSlotWithStackV(stackView: self.saturdayStackView, time: slot.time, tag: 700)
                default:
                    break
                }
            }
        }
    }
    
    @IBAction func doneButtonPressed(sender: UIButton)
    {
        
        // Sendgrid email
//        func sendEmailSG()
//        {
//            // Send a basic example
//            let currentEmail = postUser.email
//            let bodyString = ""
//            let plainText = Content(contentType: ContentType.plainText, value: bodyString )
//            //let htmlText = Content(contentType: ContentType.htmlText, value: "<h1>Hello World</h1>")
//            let email = Email(
//                personalizations: [personalization],
//                from: Address("savvyinc.jobs@gmail.com"),
//                content: [plainText],
//                subject: "New Job Assigned!"
//            )
//            do {
//                try Session.shared.send(request: email)
//            } catch {
//                print(error)
//            }
//        }
        print(timeSlotDictionary)
        dismiss(animated: true, completion: nil)
    }
    
    
    // TODO: Fix sender
  @objc @IBAction func timeSlotPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            switch sender.tag
            {
            case 100..<200:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "sunday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 200..<300:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "monday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 300..<400:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "tuesday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 400..<500:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "wednesday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 500..<600:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "thursday", time: timeText)
                timeSlotDictionary[sender.tag] = timeSlot
            case 600..<700:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
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
            guard let layers = sender.layer.sublayers else {return}
            for layer in layers
            {
                if layer.name == "GradientLayer"
                {
                    layer.removeFromSuperlayer()
                }
            }
        }
        print(timeSlotDictionary)
    }
    
    // MARK: - Helper Functions
    func createBttnTimeSlotWithStackV(stackView: UIStackView, time: String, tag: Int)
    {
        let slotButton = UIButton(type: .custom)
        slotButton.layer.cornerRadius = 5.0
        slotButton.clipsToBounds = true
        //slotButton.layer.insertSublayer(GradientLayer.gradientBorder(bounds: slotButton.bounds), at: 0)
        slotButton.layer.insertSublayer(GradientLayer.gradient(bounds: slotButton.bounds), at: 0)
        slotButton.frame = CGRect(x: 0, y: 0, width: stackView.frame.width, height: 30.0)
        //slotButton.titleLabel?.textColor = UIColor.blue
        //slotButton.backgroundColor = UIColor.purple
        //slotButton.tintColor = UIColor.white
        slotButton.setTitle(time, for: UIControlState())
        slotButton.tag = tag
        slotButton.addTarget(self, action: #selector(self.timeSlotPressed(_:)), for: UIControlEvents.touchDown)
        stackView.addArrangedSubview(slotButton)
    }

}

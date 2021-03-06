//
//  TrainerTimeSlotVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 10/4/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
import SendGrid

class TrainerTimeSlotVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var trainer: Trainer?
    var newMember: NewMember?
    var timeSlotDictionary = [Int: TimeSlot]()
    var eliteButtonArray : [EliteButton] = []

    @IBOutlet weak var doneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
//        createViewBasedOnTimeSlot()
        // Do any additional setup after loading the view.
        doneButton.layer.addSublayer(GradientLayer.gradient(bounds: doneButton.bounds))
        doneButton.layer.cornerRadius = 5.0
        doneButton.layer.masksToBounds = true

        self.lookForButton(view: self.view)
//        print(eliteButtonArray.count ?? 0)
        
        guard let currentTrainer = trainer else { return }
        NewMemberService.fetchSchedule(uid: currentTrainer.uid) { (timeslots) in
            print(timeslots)
            print(self.eliteButtonArray)
            for button in self.eliteButtonArray
            {
                for slot in timeslots
                {
                    if button.tag == Int(slot.key)
                    {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                            button.alpha = 1.00
                        }
                    }
                }
            }
        }
        
        
//        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 100)
//         scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func createViewBasedOnTimeSlot()
//    {
//        guard let trainer = trainer else { return }
//        
//        NewMemberService.fetchSchedule(uid: trainer.uid) { (timeslots) in
//            print(timeslots.count)
//            var sundayY = 105.0
//            var mondayY = 105.0
//            var tuesdayY = 105.0
//            var wednesdayY = 105.0
//            var thursdayY = 105.0
//            var fridayY = 105.0
//            var saturdayY = 105.0
//            
//            var sundayTag = 100
//            var mondayTag = 200
//            var tuesdayTag = 300
//            var wednesdayTag = 400
//            var thursdayTag = 500
//            var fridayTag = 600
//            var saturdayTag = 700
//        
//            
//            for slot in timeslots
//            {
//                switch slot.dayOfTheWeek{
//                case Day.sunday.rawValue:
//                    self.createBttnTimeSlotWithPos(x : 62.0, y: sundayY, time: slot.time, tag: sundayTag)
//                   // self.createBttnTimeSlotWithStackV(stackView: self.sundayStackView, time: slot.time, tag: 100)
//                    sundayY = sundayY + 40.0
//                    sundayTag = sundayTag + 5
//                case Day.monday.rawValue:
//                    self.createBttnTimeSlotWithPos(x : 157.0, y: mondayY, time: slot.time, tag: mondayTag)
//                   // self.createBttnTimeSlotWithStackV(stackView: self.mondayStackView, time: slot.time, tag: 200)
//                    mondayY = mondayY + 40.0
//                    mondayTag = mondayTag + 5
//                case Day.tuesday.rawValue:
//                    self.createBttnTimeSlotWithPos(x : 75.0, y: tuesdayY, time: slot.time, tag: tuesdayTag)
//                   // self.createBttnTimeSlotWithStackV(stackView: self.tuesdayStackView, time: slot.time, tag: 300)
//                    tuesdayY = tuesdayY + 40.0
//                    tuesdayTag = tuesdayTag + 5
//                case Day.wednesday.rawValue:
//                    self.createBttnTimeSlotWithPos(x : 347.0, y: wednesdayY, time: slot.time, tag: wednesdayTag)
//                  //  self.createBttnTimeSlotWithStackV(stackView: self.wednesdayStackView, time: slot.time, tag: 400)
//                    wednesdayY = wednesdayY + 40.0
//                    wednesdayTag = wednesdayTag + 5
//                case Day.thursday.rawValue:
//                    self.createBttnTimeSlotWithPos(x : 442.0, y: thursdayY, time: slot.time, tag: thursdayTag)
//                  //  self.createBttnTimeSlotWithStackV(stackView: self.thursdayStackView, time: slot.time, tag: 500)
//                    thursdayY = thursdayY + 40.0
//                    thursdayTag = thursdayTag + 5
//                case Day.friday.rawValue:
//                    self.createBttnTimeSlotWithPos(x : 537.0, y: fridayY, time: slot.time, tag: fridayTag)
//                 //   self.createBttnTimeSlotWithStackV(stackView: self.fridayStackView, time: slot.time, tag: 600)
//                    fridayY = fridayY + 40.0
//                    fridayTag = fridayTag + 5
//                case Day.saturday.rawValue:
//                    self.createBttnTimeSlotWithPos(x : 632.0, y: saturdayY, time: slot.time, tag: saturdayTag)
//                  //  self.createBttnTimeSlotWithStackV(stackView: self.saturdayStackView, time: slot.time, tag: 700)
//                    saturdayY = saturdayY + 40.0
//                    saturdayTag = saturdayTag + 5
//                default:
//                    break
//                }
//            }
//        }
//    }
    
    @IBAction func doneButtonPressed(sender: UIButton)
    {
        
        // Send grid
        guard let member = self.newMember else { return }
        
        if !timeSlotDictionary.isEmpty{
            var timeslots = ""
            for (_ ,value) in timeSlotDictionary
            {
                timeslots += "<li>\(value.dayOfTheWeek.firstUppercased) \(value.time)</li>"
                print(timeslots)
            }
            guard let trainerEmail = trainer?.emailAddress else { return }
            let fullname = "\(member.firstName) \(member.lastName)"
            let focusType = "\(member.trainingPreference)"
            let hoursPerWeek = "\(member.hoursPerWeek)"
            let memberEmail = "\(trainerEmail)"
            let personalization = Personalization(recipients: memberEmail)
            let html =
            "<head><meta charset='UTF-8'> <title>Document</title></head><body><p>New client alert!</p><p>\(fullname) has requested to train with you. Here is some info on the client.</p><p>Name: \(fullname)</p><p>Focus: \(focusType.firstUppercased)</p><p>Weekly Activity: Works out \(hoursPerWeek) per week.</p><p>Time(s):<ul>\(timeslots)</ul></p><p>Please email them @ \(memberEmail)</p><p>Cheers, <br> The Elite Life & Fitness Team</p></body>"
            let htmlText = Content(contentType: ContentType.htmlText, value: html)
            let email = Email(
                personalizations: [personalization],
                from: Address(email: "watson.g@iameliteny.com"),
                content: [htmlText],
                subject: "New Client: \(fullname)"
            )
            do {
                print(email)
                try Session.shared.send(request: email)
            } catch {
                print(error)
            }
            
            let alertVC = UIAlertController(title:"Alert", message: "Trainer \(trainer?.fullname ?? "Empty") has received your request", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alertVC, animated: true, completion: nil)
            
        }
        else
        {
            print(timeSlotDictionary)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
  @objc @IBAction func timeSlotPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            switch sender.tag
            {
            case 100..<200:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "sunday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 200..<300:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "monday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 300..<400:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "tuesday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 400..<500:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "wednesday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 500..<600:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "thursday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 600..<700:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
                sender.setTitleColor(UIColor.black, for: .selected)
                guard let timeText = sender.titleLabel?.text else { return }
                let timeSlot = TimeSlot(dayOfTheWeek: "friday", time: timeText, key: String(describing:sender.tag))
                timeSlotDictionary[sender.tag] = timeSlot
            case 700..<800:
                sender.layer.insertSublayer(GradientLayer.gradient(bounds: sender.bounds), at: 0)
                sender.layer.cornerRadius = 5.0
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
                button.isEnabled = false
                button.alpha = 0.25
                self.eliteButtonArray.append(button)
            }
            else
            {
                print(v)
                lookForButton(view: v)
            }
        }
    }
    
//    func createBttnTimeSlotWithPos(x : Double, y: Double, time: String, tag: Int)
//    {
//        let slotButton = EliteButton(type: .custom)
//        slotButton.layer.cornerRadius = 5.0
//        slotButton.clipsToBounds = true
//        //slotButto               n.layer.insertSublayer(GradientLayer.gradientBorder(bounds: slotButton.bounds), at: 0)
//        //slotButton.layer.insertSublayer(GradientLayer.gradient(bounds: slotButton.bounds), at: 0)
//        slotButton.frame = CGRect(x: x, y: y, width: 60, height: 30.0)
//        //slotButton.titleLabel?.textColor = UIColor.blue
//        //slotButton.backgroundColor = UIColor.purple
//        //slotButton.tintColor = UIColor.white
//        slotButton.setTitle(time, for: UIControlState())
//        slotButton.tag = tag
//        slotButton.addTarget(self, action: #selector(self.timeSlotPressed(_:)), for: UIControlEvents.touchDown)
//        self.view.addSubview(slotButton)
////        self.scrollView.addSubview(slotButton)
////        stackView.addArrangedSubview(slotButton)
//    }
    
//    func createBttnTimeSlotWithStackV(stackView: UIStackView, time: String, tag: Int)
//    {
//        let slotButton = EliteButton(type: .custom)
//        slotButton.layer.cornerRadius = 5.0
//        slotButton.clipsToBounds = true
//        //slotButton.layer.insertSublayer(GradientLayer.gradientBorder(bounds: slotButton.bounds), at: 0)
//        slotButton.layer.insertSublayer(GradientLayer.gradient(bounds: slotButton.bounds), at: 0)
//        slotButton.frame = CGRect(x: 0, y: 0, width: stackView.frame.width, height: 30.0)
//        //slotButton.titleLabel?.textColor = UIColor.blue
//        //slotButton.backgroundColor = UIColor.purple
//        //slotButton.tintColor = UIColor.white
//        slotButton.setTitle(time, for: UIControlState())
//        slotButton.tag = tag
//        slotButton.addTarget(self, action: #selector(self.timeSlotPressed(_:)), for: UIControlEvents.touchDown)
//        stackView.addArrangedSubview(slotButton)
//    }

}

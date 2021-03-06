//
//  TrainerService.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/24/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct TrainerService
{
    static func fetchTrainer(forUID uid: String, completion: @escaping (Trainer?) -> Void) {
        let ref = Database.database().reference().child("trainers").child(uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let trainer = Trainer(snapshot: snapshot) else {
                return completion(nil)
            }
            
            completion(trainer)
        })
    }
    
    static func updateTrainerSchedule(forUID uid: String, timeSlot: TimeSlot, buttonTag: Int)
    {
        let ref = Database.database().reference().child("schedule").child(uid).child(String(describing: buttonTag))
        let dict = timeSlot.dictValue
        ref.updateChildValues(dict) { (error, reference) in
            if (error != nil)
            {
                print("Failure to insert")
            }
        }
    }
    
    static func removeTrainerSchedule(forUID uid: String)
    {
        let delRef = Database.database().reference().child("schedule").child(uid)
        delRef.removeValue { (error, reference) in
            if (error != nil)
            {
                print("Failure to remove")
            }
        }
    }
    
    static func updateTrainerFocus(forUID uid: String, focus: Focus)
    {
        let ref = Database.database().reference().child("focus").child(uid)
        let dict = focus.dictValue
        ref.updateChildValues(dict) { (error, reference) in
            if (error != nil)
            {
                print("Failure to insert")
            }
        }
    }
    
    
    
}

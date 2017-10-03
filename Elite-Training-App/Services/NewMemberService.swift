//
//  NewMemberService.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/20/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Firebase

struct NewMemberService
{
    
    static func createNewMember(firstName: String, lastName: String, email : String, genderPreference: String, trainingPreference: String, hoursPerWeek: String)
    {
        createMember(firstName: firstName, lastName: lastName, email: email, genderPreference: genderPreference, trainingPreference: trainingPreference, hoursPerWeek: hoursPerWeek)
    }
    
    private static func createMember(firstName: String, lastName: String, email : String, genderPreference: String, trainingPreference: String, hoursPerWeek: String)
    {
        let newMember = NewMember(firstName: firstName, lastName: lastName, email: email, genderPreference: genderPreference, trainingPreference: trainingPreference, hoursPerWeek: hoursPerWeek)
        let dict = newMember.dictValue
        
        let newMemberRef = Database.database().reference().child("members").childByAutoId()
        
        newMemberRef.updateChildValues(dict)
        
    }
    
    // TODO: Implemente query for trainer
    static func queryForTrainer(focus: String, gender: String, completion: @escaping ([Trainer]) -> Void)
    {
        print(focus)
        let ref = Database.database().reference().child("focus")
        
        ref.queryOrdered(byChild: focus).queryEqual(toValue:focus).observeSingleEvent(of: .value, with: { (snapshot : DataSnapshot) in
        
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let trainerUIDS : [Focus] =
                snapshot
                    .flatMap {
                        guard let focus = Focus(snapshot: $0, focus: focus)
                            else { return nil }
                        
                        return focus
                }
            
            var matchedTrainers = [Trainer]()
            let dg = DispatchGroup()
        
            for focus in trainerUIDS
            {
                dg.enter()
                let uid = focus.uid
                guard let trainerUID = uid else { return }
                let trainerRef = Database.database().reference().child("trainers").child(trainerUID)
                trainerRef.observeSingleEvent(of: .value, with: { (trainerSnapshot) in
                    print(trainerSnapshot)
                    let trainer: Trainer = Trainer(snapshot: trainerSnapshot)!
                    if trainer.gender == gender
                    {
                        // Optional Gender
                        print(trainer.gender)
                        print(gender)
                        matchedTrainers.append(trainer)
                    }
                    dg.leave()
                })
            }
            
            dg.notify(queue: .main, execute: {
              completion(matchedTrainers)
            })
                
               
            
        }) { (err) in
            print("Failed to fetch posts for search")
        }
    }
    
}

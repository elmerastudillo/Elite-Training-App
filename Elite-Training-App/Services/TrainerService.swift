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
    
}

//
//  Trainer.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class Trainer
{
    var emailAddress : String
    var fullname : String
    var profileImage: String?
    var focusArray : [String]
    var schedule : [String]
    var uid : String
    
    init(uid: String, emailAddress : String, fullname: String, profileImage: String?, focusArray: [String], schedule : [String])
    {
        self.uid = uid
        self.emailAddress = emailAddress
        self.fullname = fullname
        self.focusArray = focusArray
        self.schedule = schedule
        self.profileImage = profileImage ?? "Image"
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let emailAddress = dict["email"] as? String,
            let fullname = dict["fullname"] as? String,
            let profileImage = dict["image"] as? String,
            let focusArray = dict["focus"] as? [String],
            let schedule = dict["schdule"] as? [String]
            else { return nil }
        self.uid = snapshot.key
        self.emailAddress = emailAddress
        self.fullname = fullname
        self.profileImage = profileImage
        self.focusArray = focusArray
        self.schedule = schedule
    }
}

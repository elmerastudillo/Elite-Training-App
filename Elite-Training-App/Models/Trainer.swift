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
    var emailAddress : String?
    var fullname : String
    var profileImage: String?
    var bio: String
    var focusArray : [String]
    var schedule : [String]
    var uid : String
    
    init(uid: String, emailAddress : String, fullname: String, bio: String, profileImage: String?, focusArray: [String], schedule : [String])
    {
        self.uid = uid
        self.emailAddress = emailAddress
        self.fullname = fullname
        self.bio = bio
        self.focusArray = focusArray
        self.schedule = schedule
        self.profileImage = profileImage ?? "Image"
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let emailAddress = dict["email"] as? String,
            let fullname = dict["fullname"] as? String,
            let bio = dict["bio"] as? String,
            let profileImage = dict["image_url"] as? String,
            let focusArray = dict["focus"] as? [String],
            let schedule = dict["schedule"] as? [String]
            else { return nil }
        self.uid = snapshot.key
        self.emailAddress = emailAddress
        self.fullname = fullname
        self.bio = bio
        self.profileImage = profileImage
        self.focusArray = focusArray
        self.schedule = schedule
    }
    
    //UserDefaults
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: "uid") as? String,
            let fullname = aDecoder.decodeObject(forKey: "fullname") as? String,
            let bio = aDecoder.decodeObject(forKey: "bio") as? String,
            let profileImage = aDecoder.decodeObject(forKey: "image_url") as? String,
            let focusArray = aDecoder.decodeObject(forKey: "focus") as? [String],
            let schedule = aDecoder.decodeObject(forKey: "schedule") as? [String]
        
            else { return nil }
        
        self.uid = uid
        self.fullname = fullname
        self.bio = bio
        self.profileImage = profileImage
        self.focusArray = focusArray
        self.schedule = schedule
    }
    
    //User singleton for currently logged user
    private static var _current: Trainer?
    
    // User object current
    static var current: Trainer {
        guard let currentUser = _current else {
            fatalError("Error: current trainer doesn't exist")
        }
        
        return currentUser
    }
    
    // Function to update current user properties and save them to User Defaults
    class func setCurrent(_ user: Trainer, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            
            UserDefaults.standard.set(data, forKey: "currentTrainer")
        }
        
        _current = user
    }
}

extension Trainer: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(fullname, forKey: "fullname")
        aCoder.encode(bio, forKey: "bio")
        aCoder.encode(profileImage, forKey: "image_url")
        

    }
}


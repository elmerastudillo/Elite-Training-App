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

struct MemberService
{
    
    static func createNewMember(firstName: String, lastName: String, email : String, genderPreference: String, trainingPreference: String, workoutHours : String)
    {
        createMember(firstName: firstName, lastName: lastName, email: email, genderPreference: genderPreference, trainingPreference: trainingPreference, workoutHours: workoutHours)
    }
    
    private static func createMember(firstName: String, lastName: String, email : String, genderPreference: String, trainingPreference: String, workoutHours : String)
    {
        let newMember = NewMember(firstName: firstName, lastName: lastName, email: email, genderPreference: genderPreference, trainingPreference: trainingPreference, workoutHours: workoutHours)
        
        let dict = newMember.dictValue
        
        let newMemberRef = Database.database().reference().child("Members").childByAutoId()
        
        newMemberRef.updateChildValues(dict)
    }
}

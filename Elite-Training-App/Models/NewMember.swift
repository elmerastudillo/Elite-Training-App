//
//  NewMember.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation

class NewMember
{
    var firstName : String
    var lastName : String
    var email : String
    var genderPreference : String
    var trainingPreference : String
    var workoutHours : String
    var schedule : [String]
    // Need to implement schedule
    
    init(firstName: String, lastName: String, email: String, genderPreference: String, trainingPreference: String, workoutHours: String, schedule : [String]) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.genderPreference = genderPreference
        self.trainingPreference = trainingPreference
        self.workoutHours = workoutHours
        self.schedule = schedule
    }
}

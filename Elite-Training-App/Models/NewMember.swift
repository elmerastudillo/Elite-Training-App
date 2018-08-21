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
    var creationDate: Date
    var hoursPerWeek : String
    //TODO: Need to implement schedule
    
    
    init(firstName: String, lastName: String, email: String, genderPreference: String, trainingPreference: String, hoursPerWeek: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.genderPreference = genderPreference
        self.trainingPreference = trainingPreference
        self.creationDate = Date()
        self.hoursPerWeek = hoursPerWeek
    }
    
    var dictValue: [String : Any]
    {
        let createdAgo = creationDate.timeIntervalSince1970
        
        return ["firstName" : firstName,
                "lastName" : lastName,
                "email" : email,
                "genderPreference" : genderPreference,
                "trainingPreference" : trainingPreference,
                "hoursPerWeek" : hoursPerWeek,
                "creationDate" : createdAgo]
    }
}

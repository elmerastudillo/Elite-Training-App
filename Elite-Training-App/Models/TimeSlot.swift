//
//  TImeSlot.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/30/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

enum Hours : String
{
    case zero = "12AM"
    case one = "1AM"
    case two = "2AM"
    case three = "3AM"
    case four = "4AM"
    case five = "5AM"
    case siz = "6AM"
    case seven = "7AM"
    case eight = "8AM"
    case nine = "9AM"
    case ten = "10AM"
    case eleven = "11AM"
    case twelve = "12PM"
    case thirteen = "1PM"
    case fourteen = "2PM"
    case fifteen = "3PM"
    case sixteen = "4PM"
    case seventeen = "5PM"
    case eighteen = "6PM"
    case nineteen = "7PM"
    case twenty = "8PM"
    case twentyOne = "9PM"
    case twentyTwo = "10PM"
    case twentyThree = "11PM"
}

enum day : String
{
    case monday
    case tuesday
    case wednesday
    case thusrday
    case friday
    case saturday
    case sunday
}

class TimeSlot
{
    var dayOfTheWeek : String
    var time : Int
    
    init(dayOfTheWeek: String, time: Int)
    {
        self.dayOfTheWeek = dayOfTheWeek
        self.time = time
    }
    
    init?(snapshot: DataSnapshot)
    {
        guard let dict = snapshot.value as? [String:Any],
            let dayOfTheWeek = dict["day_of_the_week"] as? String,
            let time = dict["time"] as? Int
            else { return nil }
        
        self.dayOfTheWeek = dayOfTheWeek
        self.time = time
    }
    
    var dictValue : [String:Any]
    {
        return [
            "day_of_the_week" : dayOfTheWeek,
            "time" : time
        ]
    }
    
}

//
//  Focus.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 10/2/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class Focus
{
    var focus : String
    var uid : String?
    
    
    init(focus: String)
    {
        self.focus = focus
    }
    
    init?(snapshot: DataSnapshot, focus: String)
    {
        guard let dict = snapshot.value as? [String:Any],
            let focus = dict[focus] as? String
        else { return nil }
        
        self.focus = focus
        self.uid = snapshot.key
    }
    
//    var dictValue : [String: String]
//    {
//        guard let uid = self.uid else {return [:]}
//        return [
//            self.focus: focus,
//            "uid" : uid
//        ]
//    }
    
}

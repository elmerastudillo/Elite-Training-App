//
//  String+Uppercased.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 10/31/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation

extension String {
    var firstUppercased: String {
        // return first char in string
        guard let first = first else { return "" }
        // dropFirst: returns all the characters except first
        // uppcased: capilizes everything
        return String(first).uppercased() + dropFirst()
    }
}

//
//  StorageReference.swift
//  Savvy
//
//  Created by Elmer Astudillo on 8/5/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import FirebaseStorage

//Create an extension to StorageReference with a class method that will generate a new location for each new post that is created by the current ISO timestamp

extension StorageReference
{
    static let dateFormatter = ISO8601DateFormatter()
    
    static func newPostImageReference() -> StorageReference
    {
        let uid = Trainer.current.uid
        let timestamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
    }
}

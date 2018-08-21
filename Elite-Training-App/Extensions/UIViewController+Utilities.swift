//
//  UIViewController+Utilities.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/27/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func applyKeyboardDismisser(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
}

//
//  TrainerBio.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/27/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import UIKit

class TrainerBio : UIViewController
{
    @IBOutlet weak var profileImage: UIImage!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var focusLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didPressExit(sender:UIButton)
    {
        // Pop custom view
        navigationController?.popViewController(animated: true)
    }
    
    func configureView()
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width - 20 , height: self.view.bounds.height - 40 ))
        
        
    }
}

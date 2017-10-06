//
//  TrainerBioVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/27/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import UIKit

class TrainerBioVC : UIViewController
{
 
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var focusLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    var trainer : Trainer?
    var focus: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let trainer = self.trainer else { return }
        fullnameLabel.text = trainer.fullname
        focusLabel.text = focus
        bioLabel.text = trainer.bio
        guard let imgURL = trainer.profileImage else { return }
        let imageURL = URL(string:imgURL)
        profileImage.kf.setImage(with: imageURL)
    }
    
//    func configureView()
//    {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width - 20 , height: self.view.bounds.height - 40 ))
//
//
//    }
}

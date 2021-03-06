//
//  TrainerCell.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/25/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class TrainerCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var focusLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    override func awakeFromNib() {
       selectButton.layer.cornerRadius = 5.0
        selectButton.layer.masksToBounds = true
        infoButton.layer.cornerRadius = 5.0
        infoButton.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.layer.cornerRadius = self.imageView.bounds.size.width / 2
        self.imageView.layer.masksToBounds = true
    }
    
}

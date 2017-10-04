//
//  TrainerProfileVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/25/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
import Kingfisher

class TrainerProfileVC: UIViewController {
    @IBOutlet weak var trainerImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var bioButton: UIButton!
    @IBOutlet weak var updateFocusButton: UIButton!
    @IBOutlet weak var updateScheduleButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Trainer.current)
        
        let trainerImageURL = Trainer.current.profileImage
        self.fullNameLabel.text = Trainer.current.fullname
        // TODO: Set profile picture in firebase
//        self.trainerImageView.kf.setImage(with: trainerImageURL)
        
        bioButton.layer.addSublayer(GradientLayer.gradient(bounds: bioButton.bounds))
        logoutButton.layer.addSublayer(GradientLayer.gradient(bounds: logoutButton.bounds))
        updateFocusButton.layer.addSublayer(GradientLayer.gradient(bounds: updateFocusButton.bounds))
        updateScheduleButton.layer.addSublayer(GradientLayer.gradient(bounds: updateScheduleButton.bounds))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func bioButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func updateSchedButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "TrainerProfile", bundle: nil)
        let trainerInfoSchedVC = storyboard.instantiateViewController(withIdentifier: "TrainerInfoSchedVC")
        navigationController?.pushViewController(trainerInfoSchedVC, animated: true)
    }
    
    @IBAction func updateFocusButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "TrainerProfile", bundle: nil)
        let trainerInfoSpecVC = storyboard.instantiateViewController(withIdentifier: "TrainerInfoSpecVC")
        navigationController?.pushViewController(trainerInfoSpecVC, animated: true)
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
    }
    
}

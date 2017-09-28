//
//  TrainerProfileVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/25/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class TrainerProfileVC: UIViewController {
    @IBOutlet weak var trainerImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bioButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func updateSchedButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "", bundle: nil)
        let trainerInfoSchedVC = storyboard.instantiateViewController(withIdentifier: "")
        navigationController?.pushViewController(trainerInfoSchedVC, animated: true)
    }
    
    @IBAction func updateFocusButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "", bundle: nil)
        let trainerInfoSpecVC = storyboard.instantiateViewController(withIdentifier: "")
        navigationController?.pushViewController(trainerInfoSpecVC, animated: true)
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
    }
    
}

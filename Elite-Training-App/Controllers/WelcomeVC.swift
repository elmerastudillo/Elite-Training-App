//
//  WelcomeVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var joinNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //joinNowButton.layer.addSublayer(GradientLayer.gradientLayer(frame: joinNowButton.bounds))
        // Do any additional setup after loading the view.
        
        joinNowButton.layer.addSublayer(GradientLayer.gradient(bounds: joinNowButton.bounds))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func EliteButtonPressed(_ sender: UIButton) {
        
        //joinNowButton.isSelected = true
    }

    @IBAction func joinNowButtonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "NewMember", bundle: nil)
        let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC") as! ContactVC
        navigationController?.pushViewController(contactVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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
        let storyboard = UIStoryboard.init(name: "TrainerLogin", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "TrainerLoginVC")
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.pushViewController(loginVC, animated: false)
    }

    @IBAction func joinNowButtonPressed(_ sender: UIButton) {
        
//        let transition: CATransition = CATransition()
//        transition.duration = 0.4
//        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        transition.type = kCATransitionFade
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        
        
        let storyboard = UIStoryboard.init(name: "NewMember", bundle: nil)
        let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC") as! ContactVC
        self.navigationController?.pushViewController(contactVC, animated: false)
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

//
//  TrainerLoginVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class TrainerLoginVC: UIViewController {

    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.addSublayer(GradientLayer.gradient(bounds: loginButton.bounds))
        loginButton.layer.cornerRadius = 5.0
        loginButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        configureView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton)
    {
        dismissKeyboard()
        guard let email = emailAddress.text,
            let password = password.text else{
                return
        }
        AuthService.signIn(controller: self, email: email, password: password) { (trainer) in
            guard let trainer = trainer else {
                print("error: FIRUser does not exist!")
//                DispatchQueue.main.async {
//                    SVProgressHUD.dismiss()
                // self.errorAlertViewController()
//                }
                return
            }
            
            TrainerService.fetchTrainer(forUID: trainer.uid) { (trainer) in
                if let trainer = trainer {
                    Trainer.setCurrent(trainer, writeToUserDefaults: true)
                    let defaults = UserDefaults.standard
                    defaults.set(true, forKey: "userIsLoggedIn")
                    Trainer.loggedIn = true
                    print(trainer)
                    let storyboard = UIStoryboard.init(name: "TrainerProfile", bundle: nil)
                    let trainerProfileVC = storyboard.instantiateViewController(withIdentifier: "TrainerProfileVC")
                    self.self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
                    self.navigationController?.pushViewController(trainerProfileVC, animated: false)
                    
//                    let initialViewController = UIStoryboard.initialViewController(for: .main)
//                    self.view.window?.rootViewController = initialViewController
//                    self.view.window?.makeKeyAndVisible()
                    
                
                }
                else {
                    print("error: User does not exist!")
                    
                    //                    DispatchQueue.main.async {
                    //                        self.errorAlertViewController()
                    //                    }
                    
                    return
                }
            }
        }
    }
    
    @IBAction func EliteButtonPressed(_ sender: UIButton) {
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.popToRootViewController(animated: false)
    }
    

}


extension TrainerLoginVC
{
    func configureView()
    {
        applyKeyboardDismisser()
    }
}

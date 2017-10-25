//
//  ContactVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailAddressTF: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.addSublayer(GradientLayer.gradient(bounds: nextButton.bounds))
        nextButton.layer.cornerRadius = 5.0
        nextButton.layer.masksToBounds = true
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func eliteButtonPressed(_ sender: UIButton) {
        if Trainer.loggedIn == true
        {
            let storyboard = UIStoryboard.init(name: "TrainerProfile", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "TrainerProfileVC")
            self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
            self.navigationController?.pushViewController(loginVC, animated: false)
        }
        else
        {
            let storyboard = UIStoryboard.init(name: "TrainerLogin", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "TrainerLoginVC")
            self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
            self.navigationController?.pushViewController(loginVC, animated: false)
        }
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        dismissKeyboard()
       if let firstName = firstNameTF.text, !firstName.isEmpty,
        let lastName = lastNameTF.text, !lastName.isEmpty,
        let emailAddress = emailAddressTF.text, !emailAddress.isEmpty
       {
            if isValidEmail(testStr: emailAddress)
            {
                let storyboard = UIStoryboard.init(name: "NewMember", bundle: nil)
                let trainerPrefVC = storyboard.instantiateViewController(withIdentifier: "TrainerPrefVC") as! TrainerPrefVC
                trainerPrefVC.firstname = firstName
                trainerPrefVC.lastname = lastName
                trainerPrefVC.emailAdress = emailAddress
                self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
                self.navigationController?.pushViewController(trainerPrefVC, animated: false)
            }
            else
            {
                presentAlertController(errorString: "Invalid e-mail format")
            }
       }
       else
       {
            presentAlertController(errorString: "There can be no empty fields")
       }
      
        
    }
    
    // MARK: - Helper functions
    func presentAlertController(errorString: String)
    {
        let alertController = UIAlertController(title: "Error", message: errorString, preferredStyle: .alert)
        //alertController.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
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

extension ContactVC
{
    func configureView()
    {
        applyKeyboardPush()
        applyKeyboardDismisser()
    }
}

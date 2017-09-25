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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func eliteButtonPressed(_ sender: UIButton) {
        
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
       if let firstName = firstNameTF.text,
        let lastName = lastNameTF.text,
        let emailAddress = emailAddressTF.text,
        !firstName.isEmpty,
        !lastName.isEmpty,
        !emailAddress.isEmpty
       {
            let storyboard = UIStoryboard.init(name: "NewMember", bundle: nil)
            let trainerPrefVC = storyboard.instantiateViewController(withIdentifier: "TrainerPrefVC")
            self.navigationController?.pushViewController(trainerPrefVC, animated: true)
       }
       else
       {
            presentAlertController()
       }
      
        
    }
    
    func presentAlertController()
    {
        let alertController = UIAlertController(title: "Error", message: "There can be no empty fields", preferredStyle: .alert)
        //alertController.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
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

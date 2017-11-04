//
//  TrainerEditBioVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 10/6/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
import Firebase

class TrainerEditBioVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var bioTV: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
//    var PLACEHOLDER_TEXT = Trainer.current.bio
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        doneButton.layer.addSublayer(GradientLayer.gradient(bounds: doneButton.bounds))
        doneButton.layer.cornerRadius = 5.0
        doneButton.layer.masksToBounds = true
        fullnameTF.text = Trainer.current.fullname
        bioTV.text = Trainer.current.bio
        bioTV.isEditable = true
        bioTV.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        let ref = Database.database().reference().child("trainers").child(Trainer.current.uid)
        
        if let bioText = bioTV.text, !bioText.isEmpty,
            let fullnameText = fullnameTF.text, !fullnameText.isEmpty
        {
            ref.updateChildValues(["bio":bioText, "fullname":fullnameText])
            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            self.presentErrorAlertController()
        }
    }
    
    //
    func presentErrorAlertController()
    {
        let alertController = UIAlertController(title: "Error", message: "There can be no empty fields", preferredStyle: .alert)
        //alertController.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - TextView Delegate methods
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = currentText.characters.count
        return numberOfChars < 180
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

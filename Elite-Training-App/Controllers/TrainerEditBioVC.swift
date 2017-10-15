//
//  TrainerEditBioVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 10/6/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
import Firebase

class TrainerEditBioVC: UIViewController {

    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var bioTV: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
//    var PLACEHOLDER_TEXT = Trainer.current.bio
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        doneButton.layer.addSublayer(GradientLayer.gradient(bounds: doneButton.bounds))
        fullnameTF.text = Trainer.current.fullname
        bioTV.text = Trainer.current.bio
        bioTV.isEditable = true
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
            self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
            self.navigationController?.popViewController(animated: false)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension TrainerEditBioVC
//{
//    // MARK: Helper functions
//    func configureView(){
//        applyKeyboardPush()
//        applyKeyboardDismisser()
//    }
//
//    /* MARK: HELPER functions */
//    func dimissKeyboard()
//    {
//        view.endEditing(true)
//    }
//
//    // MARK: - Helper functions for custom placeholder
//    // function for styling need to create custom placeholder for textView
//    func applyPlaceholderStyle(aTextview: UITextView, placeholderText: String)
//    {
//        // make it look (initially) like a placeholder
//        aTextview.textColor = UIColor.darkGray
//        aTextview.text = placeholderText
//    }
//
//    func applyNonPlaceholderStyle(aTextview: UITextView)
//    {
//        // make it look like normal text instead of a placeholder
//        aTextview.textColor = UIColor.darkText
//        aTextview.alpha = 1.0
//    }
//
//    func moveCursorToStart(aTextView: UITextView)
//    {
//        DispatchQueue.main.async { () -> Void in
//            aTextView.selectedRange = NSMakeRange(0, 0)
//        }
//    }
//}
//
//extension TrainerEditBioVC : UITextViewDelegate
//{
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//
//    /* MARK: - Text View Delegate functions */
//
//    //Custom dissmissKeyboard function called (Dismisses keyboard with a click on the view)
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.dimissKeyboard()
//    }
//
//    //TODO: Needs to be fixed cursor keeps showing up at the end of the line
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView == bioTV && textView.text == PLACEHOLDER_TEXT
//        {
//            // function to move cursor to the beggining
//            self.moveCursorToStart(aTextView: textView)
//        }
//
//    }
//
//    // For custom placeholder in TextView
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
//    {
//        /* Creating custom placeholder to mimic TextField Placeholder */
//        //remove the placeholder text when they start typing
//        // first, see if the field is empty
//        // If its not empty, then the text should be black and not italic
//        // But, we also need to remove the placeholder text if thats the only text
//
//        //text.utf16.count gets the length of the string
//        let newLength = textView.text.utf16.count + text.utf16.count - range.length
//        if newLength > 0 // Have text, so don't show the placeholder
//        {
//            //check if the only text is the placeholder and remove it if needed
//            if textView == bioTV && textView.text == PLACEHOLDER_TEXT
//            {
//                if text.utf16.count == 0 //They hit the back button
//                {
//                    return false
//                }
//
//                //Changing textView text back to dark color
//                applyNonPlaceholderStyle(aTextview: textView)
//                textView.text = ""
//            }
//
//            return true
//        }
//        else // no text, so show the placeholder
//        {
//            applyPlaceholderStyle(aTextview: textView, placeholderText: PLACEHOLDER_TEXT)
//            moveCursorToStart(aTextView: textView)
//            return false
//        }
//
//    }
//
//    func textViewDidChangeSelection(_ textView: UITextView) {
//        if textView == bioTV && textView.text == PLACEHOLDER_TEXT
//        {
//            moveCursorToStart(aTextView: textView)
//        }
//    }
//
//}


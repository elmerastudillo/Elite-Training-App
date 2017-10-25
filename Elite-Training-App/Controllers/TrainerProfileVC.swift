//
//  TrainerProfileVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/25/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
import Kingfisher
import Presentr
import Firebase

class TrainerProfileVC: UIViewController {
    
    @IBOutlet weak var trainerImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var bioButton: UIButton!
    @IBOutlet weak var updateFocusButton: UIButton!
    @IBOutlet weak var updateScheduleButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    var authHandle: AuthStateDidChangeListenerHandle?
    
    var photoHelper = PhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bioButton.layer.insertSublayer(GradientLayer.gradient(bounds: bioButton.bounds), at: 0)
        bioButton.layer.cornerRadius = 5.0
        bioButton.layer.masksToBounds = true
        
        logoutButton.layer.insertSublayer(GradientLayer.gradient(bounds: bioButton.bounds), at: 0)
        logoutButton.layer.cornerRadius = 5.0
        logoutButton.layer.masksToBounds = true
        
        updateFocusButton.layer.insertSublayer(GradientLayer.gradient(bounds: bioButton.bounds), at: 0)
        updateFocusButton.layer.cornerRadius = 5.0
        updateFocusButton.layer.masksToBounds = true
        
        updateScheduleButton.layer.insertSublayer(GradientLayer.gradient(bounds: bioButton.bounds), at: 0)
        updateScheduleButton.layer.cornerRadius = 5.0
        updateScheduleButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        print(Trainer.current)
        
        self.trainerImageView.roundedImage()
        
        photoHelper.completionHandler = { image in
            self.trainerImageView.image = image
            let imageRef = StorageReference.newPostImageReference()
            
            StorageService.uploadImage(self.trainerImageView.image!, at:imageRef ) { (downloadURL) in
                guard let downloadURL = downloadURL else {
                    return
                }
            let ref = Database.database().reference().child("trainers").child(Trainer.current.uid)
                ref.updateChildValues(["image_url" : String(describing:downloadURL)], withCompletionBlock: { (error, reference) in
                    if error != nil
                    {
                        print("Error")
                    }
                })
                
                
                let trainer = Trainer(uid: Trainer.current.uid, emailAddress: Trainer.current.emailAddress!, fullname: Trainer.current.fullname, bio: Trainer.current.bio, profileImage: String(describing: downloadURL))
            
            Trainer.setCurrent(trainer, writeToUserDefaults: true)
            }
        }
        
        // Adding tap gesture to UIImage
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(gesture:)))
        trainerImageView.isUserInteractionEnabled = true
        trainerImageView.roundedImage()
        trainerImageView.addGestureRecognizer(tapGesture)
        trainerImageView.backgroundColor = UIColor.blue
        
        authHandle = AuthService.authListener(viewController: self)
        guard let trainerImageURL = URL(string: Trainer.current.profileImage!) else { return }
//        let trainerImageURL = URL(string: Trainer.current.profileImage)
        self.fullNameLabel.text = Trainer.current.fullname
        // TODO: Set profile picture in firebase
        self.trainerImageView.kf.setImage(with: trainerImageURL)
    }
    
    deinit {
        AuthService.removeAuthListener(authHandle: authHandle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func bioButtonPressed(_ sender: UIButton) {
            // Create a UIView that pops open when info is clicked
        //Getting indexpath by using points
//        let point = trainerSelectVC.convert(CGPoint.zero, from: sender)
//        guard let indexPath = trainerSelectVC.indexPathForItem(at: point) else {
//            fatalError("can't find point in tableView")
//        }
//        let currentTrainer = trainers[indexPath.item]
        let bioPresenter = Presentr(presentationType: .popup)
        bioPresenter.presentationType = .popup
        bioPresenter.backgroundOpacity = 0.50
        bioPresenter.roundCorners = true
        bioPresenter.dismissOnSwipe = true
        let storyboard = UIStoryboard.init(name: "TrainerPopUp", bundle: nil)
        let trainerBioVC = storyboard.instantiateViewController(withIdentifier: "TrainerEditBioVC") as! TrainerEditBioVC
        customPresentViewController(bioPresenter, viewController: trainerBioVC, animated: true, completion: nil)
    }
    
    @IBAction func updateSchedButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "TrainerSched", bundle: nil)
        let trainerInfoSchedVC = storyboard.instantiateViewController(withIdentifier: "TrainerInfoSchedVC")
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.pushViewController(trainerInfoSchedVC, animated: false)
    }
    
    @IBAction func updateFocusButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "TrainerProfile", bundle: nil)
        let trainerInfoSpecVC = storyboard.instantiateViewController(withIdentifier: "TrainerInfoSpecVC")
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.pushViewController(trainerInfoSpecVC, animated: false)
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            Trainer.loggedIn = false
            self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
            self.navigationController?.popToRootViewController(animated: false)
        } catch let error as NSError {
            assertionFailure("Error signing out: \(error.localizedDescription)")
        }
    }
    
    @IBAction func eliteButtonPressed(_ sender: UIButton) {
        
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.popToRootViewController(animated: false)
    }
    func handleTapGesture(gesture: UITapGestureRecognizer) {
        print("handleTapGesture activated")
        let alertController = photoHelper.presentActionSheet(from: self)
        alertController.popoverPresentationController?.sourceView = self.trainerImageView
        alertController.popoverPresentationController?.sourceRect = self.trainerImageView.bounds
//            CGRect(x: self.view.bounds.size.width / 2.0, y: self.view.bounds.size.height / 2.0, width: 5.0, height: 5.0)
//            CGRect(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

//
//  TrainerSelectVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
import Presentr
import Kingfisher

class TrainerSelectVC: UIViewController {
    
    var focus : String?
    var gender: String?
    var trainers = [Trainer]()

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var trainerSelectVC: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let focus = self.focus else { return }
        guard let gender = self.gender else { return }
        
        doneButton.layer.addSublayer(GradientLayer.gradient(bounds: doneButton.bounds))
        doneButton.layer.cornerRadius = 5.0
        doneButton.layer.masksToBounds = true
        
        NewMemberService.queryForTrainer(focus: focus, gender: gender) { (trainers) in
            self.trainers = trainers
            DispatchQueue.main.async {
                self.trainerSelectVC.reloadData()
            }
        }

        // Do any additional setup after loading the view.
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
    
    @IBAction func selectButtonPressed(sender: UIButton)
    {
        let point = trainerSelectVC.convert(CGPoint.zero, from: sender)
        guard let indexPath = trainerSelectVC.indexPathForItem(at: point) else {
            fatalError("can't find point in tableView")
        }
        let currentTrainer = trainers[indexPath.item]
        let bioPresenter = Presentr(presentationType: .popup)
        bioPresenter.presentationType = .custom(width: .sideMargin(value: 60), height: .sideMargin(value: 60), center: .center)
        bioPresenter.backgroundOpacity = 0.50
        bioPresenter.blurBackground = true
        bioPresenter.roundCorners = true
        bioPresenter.dismissOnSwipe = true
        let storyboard = UIStoryboard.init(name: "TrainerPopUp", bundle: nil)
        let trainerTimeSlotVC = storyboard.instantiateViewController(withIdentifier: "TrainerTimeSlotVC") as! TrainerTimeSlotVC
        trainerTimeSlotVC.trainer = currentTrainer
        customPresentViewController(bioPresenter, viewController: trainerTimeSlotVC, animated: true, completion: nil)
    }
    
    @IBAction func infoButtonPressed(sender: UIButton)
    {
        // Create a UIView that pops open when info is clicked
        //Getting indexpath by using points
        let point = trainerSelectVC.convert(CGPoint.zero, from: sender)
        guard let indexPath = trainerSelectVC.indexPathForItem(at: point) else {
            fatalError("can't find point in tableView")
        }
        let currentTrainer = trainers[indexPath.item]
        let bioPresenter = Presentr(presentationType: .popup)
        bioPresenter.presentationType = .popup
        bioPresenter.backgroundOpacity = 0.50
        bioPresenter.roundCorners = true
        bioPresenter.dismissOnSwipe = true
        let storyboard = UIStoryboard.init(name: "TrainerPopUp", bundle: nil)
        let trainerBioVC = storyboard.instantiateViewController(withIdentifier: "TrainerBioVC") as! TrainerBioVC
        trainerBioVC.trainer = currentTrainer
        trainerBioVC.focus = self.focus
        customPresentViewController(bioPresenter, viewController: trainerBioVC, animated: true, completion: nil)
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        self.navigationController?.view.layer.add(Transition.fadeTransition(), forKey: nil)
        self.navigationController?.popToRootViewController(animated: false)
    }
}

extension TrainerSelectVC : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let cell = collectionView.cellForItem(at: indexPath) as!  TrainerCell
        if cell.selectButton.isHidden == true
        {
            cell.imageView.layer.insertSublayer(GradientLayer.gradientOpaque(bounds: cell.imageView.bounds),  at: 0)
        }
        cell.selectButton.isHidden = false
        cell.infoButton.isHidden = false
//        cell.imageView.layer.insertSublayer(GradientLayer.gradient(bounds: cell.bounds), at: 0)
        
        cell.selectButton.addTarget(self, action: #selector(selectButtonPressed), for: UIControlEvents.touchDown)
        cell.infoButton.addTarget(self, action: #selector(infoButtonPressed), for: UIControlEvents.touchDown)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = false
        if let cell = collectionView.cellForItem(at: indexPath) as? TrainerCell
        {
            cell.selectButton.isHidden = true
            cell.infoButton.isHidden = true
            
            guard let layers = cell.imageView.layer.sublayers else {return}
            for layer in layers
            {
                if layer.name == "GradientLayer"
                {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
}

extension TrainerSelectVC : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "trainerCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TrainerCell
        let trainer = trainers[indexPath.item]
        //cell.backgroundColor = UIColor.darkGray
//        cell.imageView.backgroundColor = UIColor.purple
        cell.imageView.roundedImage()
//        cell.imageView.layer.addSublayer(GradientLayer.gradientBorder(bounds: cell.bounds))
        
        cell.selectButton.isHidden = true
        cell.infoButton.isHidden = true
        cell.nameLabel.text = trainer.fullname
        cell.focusLabel.text = focus
//        cell.layer.borderWidth = 5.0
//        cell.imageView.layer.insertSublayer(GradientLayer.gradientBorder(bounds: cell.imageView.bounds), at: 0)
//        cell.layer.insertSublayer(GradientLayer.gradientBorder(bounds: cell.bounds), at: 0)
        guard let imgURL = trainer.profileImage else { return cell }
        let imageURL = URL(string:imgURL)
        cell.imageView.kf.setImage(with:imageURL)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return trainers.count
    }
}

extension TrainerSelectVC: UICollectionViewDelegateFlowLayout
{
    //we use the number of columns to calculate the item size of each UICollectionViewCell. This guarentees we'll have a evenly sized 3x3 row regardless of the device we're using.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 2
        let spacing: CGFloat = 5.0
        let totalHorizontalSpacing = (columns - 1) * spacing
        
        let itemWidth = (collectionView.bounds.width - totalHorizontalSpacing) / columns
        let itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
        
}

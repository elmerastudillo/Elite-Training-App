//
//  TrainerSelectVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
import Presentr

class TrainerSelectVC: UIViewController {
    
    var focus : String?
    var gender: String?
    var trainers : [Trainer]?

    @IBOutlet weak var trainerSelectVC: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let focus = self.focus else { return }
        guard let gender = self.gender else { return }
        
        NewMemberService.queryForTrainer(focus: focus, gender: gender) { (trainers) in
            self.trainers = trainers
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func selectButtonPressed()
    {
        let bioPresenter = Presentr(presentationType: .popup)
        bioPresenter.presentationType = .popup
        bioPresenter.backgroundOpacity = 0.50
        bioPresenter.roundCorners = true
        let storyboard = UIStoryboard.init(name: "TrainerPopUp", bundle: nil)
        let trainerBioVC = storyboard.instantiateViewController(withIdentifier: "TrainerBioVC") as! TrainerBioVC
        customPresentViewController(bioPresenter, viewController: trainerBioVC, animated: true, completion: nil)
        
    }
    
    @IBAction func infoButtonPressed()
    {
        // Create a UIView that pops open when info is clicked
        let bioPresenter = Presentr(presentationType: .popup)
        bioPresenter.presentationType = .popup
        bioPresenter.backgroundOpacity = 0.50
        bioPresenter.roundCorners = true
        let storyboard = UIStoryboard.init(name: "TrainerPopUp", bundle: nil)
        let trainerBioVC = storyboard.instantiateViewController(withIdentifier: "TrainerBioVC") as! TrainerBioVC
        customPresentViewController(bioPresenter, viewController: trainerBioVC, animated: true, completion: nil)
        
    }
    
//    func addViewToCell(collectionView: UICollectionView, indexPath: IndexPath)
//    {
//        let cell = collectionView.cellForItem(at: indexPath) as! TrainerCollectionViewCell
//        let view =
//        let selectButton = UIButton(frame: CGRect(x: 0, y: 20, width: 20, height: 20))
//        selectButton.titleLabel?.text = "Select"
//        selectButton.addTarget(self, action: #selector(selectButtonPressed), for: UIControlEvents.touchDown)
//        let infoButton = UIButton(frame: CGRect(x: 0, y: 30, width: 20, height: 20))
//        infoButton.titleLabel?.text = "i"
//        infoButton.addTarget(self, action: #selector(infoButtonPressed), for: UIControlEvents.touchDown)
//        cell.imageView.addSubview(selectButton)
//        cell.imageView.addSubview(infoButton)
//    }
    
  

}

extension TrainerSelectVC : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let cell = collectionView.cellForItem(at: indexPath) as!  TrainerCell
        cell.selectButton.isHidden = false
        cell.infoButton.isHidden = false
        cell.selectButton.addTarget(self, action: #selector(selectButtonPressed), for: UIControlEvents.touchDown)
        cell.infoButton.addTarget(self, action: #selector(infoButtonPressed), for: UIControlEvents.touchDown)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = false
        if let cell = collectionView.cellForItem(at: indexPath) as? TrainerCell
        {
            cell.selectButton.isHidden = true
            cell.infoButton.isHidden = true
        }
    }
}

extension TrainerSelectVC : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "trainerCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TrainerCell
        //cell.backgroundColor = UIColor.darkGray
        cell.imageView.backgroundColor = UIColor.purple
        cell.imageView.roundedImage()
        cell.selectButton.isHidden = true
        cell.infoButton.isHidden = true
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
}

extension TrainerSelectVC: UICollectionViewDelegateFlowLayout
{
    //we use the number of columns to calculate the item size of each UICollectionViewCell. This guarentees we'll have a evenly sized 3x3 row regardless of the device we're using.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        var itemSize = CGSize()
//        let columns: CGFloat = 2
//        let spacing: CGFloat = 1.5
//        let totalHorizontalSpacing = (columns - 1) * spacing
//        let itemWidth = (collectionView.bounds.width - totalHorizontalSpacing) / columns
//        let itemHeight = (collectionView.bounds.width - totalHorizontalSpacing) / columns
//        let newItemSize = CGSize(width: itemWidth, height: itemHeight)
//        itemSize = newItemSize
        
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

//
//  ScheduleVC.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/18/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController {

    @IBOutlet weak var selectTrainerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectTrainerButtonPressed(_ sender: UIButton)
    {
        let storyboard = UIStoryboard(name: "TrainerSelect", bundle: nil)
        
        let trainerSelectVC = storyboard.instantiateViewController(withIdentifier: "TrainerSelectVC")
            
        navigationController?.pushViewController(trainerSelectVC, animated: true)
    }
    

    @IBAction func eliteButtonPressed(_ sender: UIButton)
    {
        
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

//
//  HomeViewController.swift
//  Workout App
//
//  Created by Sanketh Hegde on 4/1/17.
//  Copyright © 2017 Sanketh Hegde. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lostNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let startingBalance = defaults.integer(forKey: "startingBalance")
        let currentBalance = defaults.integer(forKey: "currentBalance")
        let moneyLeft = startingBalance - currentBalance
        lostNumber.text = "$" + String(moneyLeft)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {

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

}

//
//  MoneyLostViewController.swift
//  Workout App
//
//  Created by Sanketh Hegde on 4/1/17.
//  Copyright © 2017 Sanketh Hegde. All rights reserved.
//

import UIKit

class MoneyLostViewController: UIViewController {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var lostNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        box.layer.cornerRadius = 4
        box.layer.masksToBounds = true
        box.layer.borderWidth = 1
        box.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        
        let defaults = UserDefaults.standard
        let startingBalance = defaults.integer(forKey: "startingBalance")
        let currentBalance = defaults.integer(forKey: "currentBalance")
        let moneyLost = startingBalance - currentBalance
        lostNumber.text = "$" + String(moneyLost)
        if (moneyLost > 0) {
            lostNumber.textColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        }
        else {
            lostNumber.textColor = UIColor(red: 0, green: 128/255, blue: 64/255, alpha: 1)
        }
        // Do any additional setup after loading the view.
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

}

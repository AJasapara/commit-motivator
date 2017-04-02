//
//  MusicViewController.swift
//  Workout App
//
//  Created by Arpit Jasapara on 4/2/17.
//  Copyright © 2017 Sanketh Hegde. All rights reserved.
//

import UIKit
import AVFoundation


class MusicViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (mainLabel.text == "Last warning! Don't you dare press the button again!"){
            mainLabel.text = "Fine. You're persistent. I like that."
            secondLabel.text = "Enjoy this sneak peek of a hype song!"
            let path = Bundle.main.url(forResource: "Work", withExtension: "mp3")
            do{
            audioPlayer = try AVAudioPlayer(contentsOf: path!, fileTypeHint: "mp3")
            } catch{}
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        if (mainLabel.text == "I said \"This Section is Under Development!\""){
            mainLabel.text = "Last warning! Don't you dare press the button again!"
        }
        if (mainLabel.text == "This Section is Under Development!"){
        mainLabel.text = "I said \"This Section is Under Development!\""
        }

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

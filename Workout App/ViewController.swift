//
//  ViewController.swift
//  Workout App
//
//  Created by Sanketh Hegde on 3/31/17.
//  Copyright © 2017 Sanketh Hegde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var initialCommit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialCommit.text = "$45"
        initialCommit.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editingChanged(_ sender: Any) {
        // Make sure dollar sign is always present
        if (!dollarSignExists(text: initialCommit.text!)) {
            initialCommit.text = "$" + initialCommit.text!
        }
        // Limit character length
        if ((initialCommit.text?.length)! > 4) {
            initialCommit.text = initialCommit.text?.substring(to: (initialCommit.text?.length)!-1)
        }
        /*
        if (initialCommit.text == "$") {
            initialCommit.text = ""
        }
        */
    }
    
    func dollarSignExists(text: String) -> Bool {
        return text[0] == "$"
    }
}

extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
}


//
//  ViewController.swift
//  Workout App
//
//  Created by Sanketh Hegde on 3/31/17.
//  Copyright © 2017 Sanketh Hegde. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var initialCommit: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var sampleDays: UILabel!
    
    var locationManager = CLLocationManager()
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        manager.stopUpdatingLocation()
        let defaults = UserDefaults.standard
        defaults.set(userLocation, forKey: "gymLocation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()

        }
        // Do any additional setup after loading the view, typically from a nib.
        initialCommit.text = "$45"
        initialCommit.becomeFirstResponder()
        sampleDays.text = "(0 days)"
        datePicker.minimumDate = Date()
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
    
    @IBAction func dateEdited(_ sender: Any) {
        let daysBetween = Utils.calculateDaysBetweenTwoDates(start: Date(), end: datePicker.date)
        sampleDays.text = "(" + String(daysBetween) + " days)"
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let initialText = initialCommit.text
        // Removing dollar sign
        let index = initialText?.index((initialText?.startIndex)!, offsetBy: 1)
        let initialInt: Int = Int((initialText?.substring(from: index!))!)!
        let defaults = UserDefaults.standard
        
        // Setting initial balance
        defaults.set(initialInt, forKey: "startingBalance")
        defaults.set(initialInt, forKey: "currentBalance")
        defaults.set(datePicker.date, forKey: "endDate")
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

extension Date {
    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
        
        let currentCalendar = Calendar.current
        
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        
        return end - start
    }
}


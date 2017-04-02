//
//  Utilities.swift
//  Workout App
//
//  Created by Sanketh Hegde on 4/1/17.
//  Copyright © 2017 Sanketh Hegde. All rights reserved.
//

import Foundation

class Utils {
    class func calculateDaysBetweenTwoDates(start: Date, end: Date) -> Int {
        return end.interval(ofComponent: .day, fromDate: start)
    }
}

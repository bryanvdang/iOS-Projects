//
//  CalculatorBrain.swift
//  BMICalculator
//
//  Created by Bryan Dang on 5/7/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var bmi: Float = 0.0
    
    func getBMIValue() -> String {//return string data type
        let bmiToOneDecimalPlace = String(format: "%.1f", bmi)//converting bmi float value to a string
        return bmiToOneDecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        bmi = ((weight * 703)/pow(height, 2))
    }
}

//
//  CalculatorBrain.swift
//  BMICalculator
//
//  Created by Bryan Dang on 5/7/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {//return string data type
        let bmiToOneDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)//converting bmi float value to a string
        return bmiToOneDecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = ((weight * 703)/pow(height, 2))
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more cake", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a Fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less cake", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
}

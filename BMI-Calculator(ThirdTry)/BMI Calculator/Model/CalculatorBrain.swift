//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by 조중윤 on 2020/07/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bmi: Float? = nil
    
    mutating func calculatedBMI(height: Float, weight: Float) {
        bmi =  weight/pow(height, 2)
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getHealthAdvice() -> String {
        var advice:String = ""
        
        if let bmiFloat = bmi {
            if (bmiFloat < 18.5) {
                advice = "You're Underweight"
            } else if (bmiFloat < 25) {
                advice = "You're Normal weight"
            } else if (bmiFloat < 30) {
                advice = "You're Over weight"
            } else if (bmiFloat >= 30) {
                advice = "You're Obese"
            }
        }
        return advice
    }
}

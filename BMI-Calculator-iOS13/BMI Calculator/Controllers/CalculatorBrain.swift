//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by 유연탁 on 2021/12/28.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func checkBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .blue)
        }
        else if bmiValue >= 18.5 && bmiValue <= 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
        }
        
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace =  String(format: "%.1f", bmi?.value ?? 0.0 )
        return bmiTo1DecimalPlace
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? .white
    }
}

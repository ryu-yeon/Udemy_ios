//
//  BillBrain.swift
//  Tipsy
//
//  Created by 유연탁 on 2022/04/09.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateBrain {
    
    var bill: Bill?
   
    
    mutating func calculateResult(billTotal: String, tip: Float, numberOfPeople: Int) {
        let result = (Float(billTotal) ?? 0.0) * (1 + tip) / Float(numberOfPeople)
        let finalResult = String(format: "%.2f", result)
        bill = Bill(tip: tip, numberOfPeople: numberOfPeople, finalResult: finalResult)
    }
    
    func getFinalResult() -> String {
        return bill?.finalResult ?? ""
    }
    
    func getSetting() -> String {
        return "Split between \(bill?.numberOfPeople ?? 0) people, with \(Int((bill?.tip ?? 0) * 100))% tip"
    }

}

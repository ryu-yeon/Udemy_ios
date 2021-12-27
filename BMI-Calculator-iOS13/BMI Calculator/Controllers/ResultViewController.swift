//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by 유연탁 on 2021/12/27.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiVlaue: String?
    var bmiAdvice: String?
    var bmiColor: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiVlaue
        adviceLabel.text = bmiAdvice
        view.backgroundColor = bmiColor

        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    


}

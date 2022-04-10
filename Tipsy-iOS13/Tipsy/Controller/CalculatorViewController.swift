//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var calculateBrain = CalculateBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Float = 0.1
    var numberOfPeople: Int = 2
    var finalResult: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        if zeroPctButton.isSelected == true {
            tip = 0.0
        } else if tenPctButton.isSelected == true {
            tip = 0.1
        } else {
            tip = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
        
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let billTotal = billTextField.text!
        
        calculateBrain.calculateResult(billTotal: billTotal, tip: tip, numberOfPeople: numberOfPeople)
        
        performSegue(withIdentifier: "goToResult", sender: true)
        
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = calculateBrain.getFinalResult()
            destinationVC.setting = calculateBrain.getSetting()
        }
        
    }


}


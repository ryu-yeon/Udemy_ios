//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 유연탁 on 2021/12/28.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var result: String?
    var tip: Float?
    var splitPerson: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingLabel.text = "split between \(splitPerson!) people, with \(Int(tip!)*100)% tip."
   
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

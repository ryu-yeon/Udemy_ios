//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    
    var storyBrain = StoryBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    @IBAction func buttoenPressed(_ sender: UIButton) {
        
        storyBrain.getNextStoryText(choice: sender.currentTitle!)

        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

        
    }
    
    
    
    @objc func updateUI() {
        storyLabel.text = storyBrain.getStoryText()
        choice1Button.setTitle(storyBrain.getChoice1Text(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2Text(), for: .normal)

    }


}


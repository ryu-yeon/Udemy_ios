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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userChoice = sender.currentTitle!
        storyBrain.nextStory(userChoice)
        sender.alpha = 0.5
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI) , userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        choice2Button.alpha = 1
        choice1Button.alpha = 1
        storyLabel.text = storyBrain.getStroyText()
        choice1Button.setTitle(storyBrain.getChoice1Text(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2Text(), for: .normal)
    }
    

}


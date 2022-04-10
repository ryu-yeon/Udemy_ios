//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var uiTitle: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var lableView: UILabel!

    
    var player: AVAudioPlayer!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var secondsRemaining = 60
    var seconds = 0
    var timer = Timer()
        
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        stopSound()
        timer.invalidate()
        progressView.progress = 0.0
        uiTitle.text = hardness
        lableView.text = "0%"
        secondsRemaining = eggTimes[hardness]!
        seconds = eggTimes[hardness]!

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if(secondsRemaining > 0) {
            secondsRemaining -= 1
            progressView.progress = Float(1 - Double(secondsRemaining)/Double(seconds))
            lableView.text = "\(Float(1 - Double(secondsRemaining)/Double(seconds))*100)%"
        }
        else if (secondsRemaining == 0) {
            uiTitle.text = "Done!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    func stopSound() {
        player?.stop()
    }
}

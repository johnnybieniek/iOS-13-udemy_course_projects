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
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressView.progress = 0
        titleLabel.text = "How do you like your eggs?"
        secondsPassed = 0
        timer.invalidate()
        
        let hardness = String(sender.currentTitle!)
    
        totalTime = eggTimes[hardness]!
      
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
       
}

    @objc func updateTime() {
        
        if secondsPassed < totalTime {
           let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressView.progress = percentageProgress
            
            secondsPassed+=1
        } else {
            titleLabel.text = "Done!"
            progressView.progress = 1
            timer.invalidate()
            playSound()
        }
    }
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    
}

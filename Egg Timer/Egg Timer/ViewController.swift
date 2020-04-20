//
//  ViewController.swift
//  Egg Timer
//
//  Created by Bryan Dang on 4/16/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    // label that asks "How do you like your eggs?"
    
    var player: AVAudioPlayer! //for audio player
    
    // let is a constant key word
    //    let softTime = 5
    //    let mediumTime = 7
    //    let hardTime = 12
    // Using single dictionary to set times
    let eggTimes: [String:Int] = ["Soft": 3, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer() //timer variable that holds the timer function
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate() //stop the timer so that when the user clicks a button it resets and starts over
        let hardness = sender.currentTitle! //Soft,Medium, Hard
        totalTime = eggTimes[hardness]! //assigning 300,420,720 to the totalTime variable
        
        //Reset
        progressBar.progress = 0.0 //reset progress bar to 0%
        secondsPassed = 0
        titleLabel.text = hardness //display which egg we are cooking
        
        //timeInterval: 1.0 how often do u want to display timer, every 1 sec
        //repeat because we don't want it to stop after the first second
        //selector, call this function everytime the time interval fires/ also remant of obj-c hence '@objc' tag for method
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() { //gets called every second
        if secondsPassed < totalTime { //if seconds passed is less than total time (300,420,720)
            secondsPassed += 1 //increment progress bar every time a second until it's no longer less than total time
            progressBar.progress = Float(secondsPassed) / Float(totalTime) //set the progress bar to reflect decimal(float) value incrementing

        } else {
            timer.invalidate()
            titleLabel.text = "DONE"
            playSound(soundName: "alarm_sound")
        }
    }
    // expression used to display time
    // percentageProgress =  secondsPassed/totalTime
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

//
//  ViewController.swift
//  Quizlet
//
//  Created by Bryan Dang on 4/20/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain() //created an "instance" of the QuizBrain struct, now we can use our quiz brain inside our controller.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    //IB function whenever true or false is selected
    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle! //current title is the 'true'/'false' buttons
        let userGotItRight = quizBrain.checkAnswer(userAnswer) //check the user answer from line 28
    
        if userGotItRight == true { // can remove '== true' but keeping for readablity
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        //added timer to remove answer color(green/red) by calling the 'updateUI' function after 0.2 seconds
        
        quizBrain.nextQuestion()
    }
    
    @objc func updateUI() {
        //on page load, set the question label to quiz array
        questionLabel.text = quizBrain.getQuestionText() //set the question label
        progressBar.progress = quizBrain.getProgress()
        
        trueButton.backgroundColor = UIColor.clear //clear UI button after every question
        falseButton.backgroundColor = UIColor.clear
        

    }
}


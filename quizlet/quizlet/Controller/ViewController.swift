//
//  ViewController.swift
//  Quizlet
//
//  Created by Bryan Dang on 4/20/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//  Controller in charge of delegating tasks and calling the methods in QuizBrain (quizBrain.nextQuestion()) and updating the UI

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
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
        
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        var text = "Score: \(quizBrain.getScore())"
        text += "/ \(quizBrain.quiz.count)"
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = text
        
        choice1.backgroundColor = UIColor.clear //clear UI button after every question
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear

    }
}


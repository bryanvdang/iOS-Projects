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
    
    let quiz = [
        ["Four + two is equal to six", "True"],
        ["Five minus three is greater than one", "True"],
        ["Three + eight is less than ten", "False"]
    ]
   
    //variable to keep track of which question the user is currently reading
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    //IB function whenever true or false is selected
    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle //current title is the 'true'/'false' buttons
        let actualAnswer = quiz[questionNumber][1] //position one is the array column holding the true/falses
    
        if userAnswer == actualAnswer {
            print("Correct!")
        } else {
            print("Incorrect :(")
        }
        
        if questionNumber + 1 < quiz.count { //add 1 so that the number surpasses the count
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        updateUI()
        
    }
    
    func updateUI() {
        //on page load, set the question label to quiz array
        questionLabel.text = quiz[questionNumber][0]
    }
}


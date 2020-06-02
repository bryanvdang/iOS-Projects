//
//  QuizBrain.swift
//  Quizlet
//
//  Created by Bryan Dang on 4/23/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
        
//variable to keep track of which question the user is currently reading
var questionNumber = 0
var score = 0

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        
        return score
    }
    
    //telling the computer that when this function is run, it will replace the old value with a new value
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count { //add 1 so that the number surpasses the count
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0 //reset score and question number to zero when user has gone through all the questions
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text //return question text that corresponds to question number
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
        // increment question number so u can fully fill up the progress bar. Obviously the the progress bar is the current question number divided by the total number of questions.
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
}

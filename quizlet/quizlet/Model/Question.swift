//
//  Question.swift
//  Quizlet
//
//  Created by Bryan Dang on 4/23/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: String

    init(q: String, a: String) {
        question = q
        answer = a
    }
}

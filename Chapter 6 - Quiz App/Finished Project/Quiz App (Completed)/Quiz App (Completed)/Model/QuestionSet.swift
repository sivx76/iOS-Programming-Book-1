//
//  QuestionSet.swift
//  Quiz App
//
//  Created by Ben Alemu on 6/21/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import Foundation

struct QuestionSet {
    
    var questions = [Question]()
    
    init() {
        
        let question1 = Question(text: "Dogs are a popular animal.", correctAnswer: true)
        let question2 = Question(text: "Apple Inc. is based in San Diego, CA.", correctAnswer: false)
        let question3 = Question(text: "Benyam Alemu is the author of this book.", correctAnswer: true)
        let question4 = Question(text: "This book covers the Android OS.", correctAnswer: false)
        let question5 = Question(text: "An eel is a type of cat.", correctAnswer: false)
        
        questions.append(question1)
        questions.append(question2)
        questions.append(question3)
        questions.append(question4)
        questions.append(question5)
        
    }
    
}

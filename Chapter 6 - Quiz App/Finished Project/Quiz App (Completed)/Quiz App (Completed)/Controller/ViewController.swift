//
//  ViewController.swift
//  Quiz App
//
//  Created by Ben Alemu on 6/21/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questionSet = QuestionSet()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = questionSet.questions[0]
        questionLabel.text = firstQuestion.text
        
        updateUI()

    }
    
    
    
    func answerPressed() {
      
          checkAnswer()
          
          questionNumber += 1
          
          nextQuestion()
       }
    

    
    @IBAction func pressedTrue(_ sender: Any) {
        
        pickedAnswer = true
        
        answerPressed()
    }
    
    
    
    @IBAction func pressedFalse(_ sender: Any) {
        
        pickedAnswer = true
        
        answerPressed()
    }
    
    
    
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        
        progressLabel.text = "Question: \(questionNumber + 1) / \(questionSet.questions.count)"
        
        progressBar.progress = Float(questionNumber) / Float(questionSet.questions.count)
    }
    
    
    
    func nextQuestion() {
        
        if questionNumber <= questionSet.questions.count-1 {
            questionLabel.text = questionSet.questions[questionNumber].text
            
            updateUI()
        }
        
        else {
            let alert = UIAlertController(title: "Awesome", message: "You have finished all of the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = questionSet.questions[questionNumber].correctAnswer
        
        if correctAnswer == pickedAnswer {
            score += 100
            
            title = "Correct!"
        }
        
        else {
            title = "Wrong Answer!"
        }
    }
    
    
    
    func startOver() {
        
        questionNumber = 0
        nextQuestion()
        
        title = ""
    }


}


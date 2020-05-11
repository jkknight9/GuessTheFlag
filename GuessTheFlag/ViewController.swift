//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Jack Knight on 5/7/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var answerSelected = 0
    var questions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
//        answerSelected = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "\(countries[correctAnswer].uppercased())                           Score: \(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String = "Wrong!"
        if questions < 9 {
            if sender.tag == correctAnswer {
                title = "Correct That is the \(countries[correctAnswer].uppercased()) flag!."
                questions += 1
                score += 1
            } else if sender.tag != correctAnswer {
                answerSelected = sender.tag
                title = "Wrong. That is the \(countries[answerSelected].uppercased()) flag!"
                questions += 1
                score -= 1
            }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        } else {
            score += 1
            let AC = UIAlertController(title: "Great Job", message: "Your final score is \(score)", preferredStyle: .alert)
            AC.addAction(UIAlertAction(title: "Play Again", style: .default, handler: askQuestion))
            present(AC, animated: true)
            score = 0
            questions = 0
            
        }
    }
}



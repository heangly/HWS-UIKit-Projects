//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Heang Ly on 8/5/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!

    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalQuestions = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion(action: nil)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        totalQuestions += 1

        if totalQuestions == 5 {
            let ac = UIAlertController(title: "The End", message: "You total score is \(score) out of \(totalQuestions)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
            totalQuestions = 0
            score = 0
        } else if sender.tag == correctAnswer {
            score += 1
        } else {
            score = score > 1 ? score - 1: 0
            let ac = UIAlertController(title: "NOOO!", message: "This is Wrong!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true, completion: nil)
        }

        askQuestion(action: nil)
    }

    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()

        button1.layer.borderWidth = 1
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button1.layer.borderColor = UIColor.lightGray.cgColor

        button2.layer.borderWidth = 1
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button2.layer.borderColor = UIColor.lightGray.cgColor

        button3.layer.borderWidth = 1
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        button3.layer.borderColor = UIColor.lightGray.cgColor

        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) | score: \(score)"
    }





}


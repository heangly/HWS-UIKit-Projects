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

    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }

    func askQuestion() {
        button1.layer.borderWidth = 1
        button1.setImage(UIImage(named: getRandomFlag()), for: .normal)
        button1.layer.borderColor = UIColor.lightGray.cgColor
        
        button2.layer.borderWidth = 1
        button2.setImage(UIImage(named: getRandomFlag()), for: .normal)
        button2.layer.borderColor = UIColor.lightGray.cgColor
        
        button3.layer.borderWidth = 1
        button3.setImage(UIImage(named: getRandomFlag()), for: .normal)
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func getRandomFlag() -> String {
        return countries[Int.random(in: 0..<countries.count)]
    }

}


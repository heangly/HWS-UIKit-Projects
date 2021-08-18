//
//  ViewController.swift
//  SwiftyWord-ProgramticallyUI
//
//  Created by Heang Ly on 8/18/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score: 0"
        label.textAlignment = .right
        return label
    }()

    private let clueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CLUES"
        label.font = UIFont.systemFont(ofSize: 24)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        return label
    }()

    private let answerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ANSWERS"
        label.font = UIFont.systemFont(ofSize: 24)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.textAlignment = .right
        return label
    }()

    private let currentAnswer: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isUserInteractionEnabled = false
        tf.placeholder = "Tap letters to guess"
        tf.font = UIFont.systemFont(ofSize: 44)
        tf.textAlignment = .center
        return tf
    }()

    private let submitButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("SUBMIT", for: .normal)
        return btn
    }()

    private let clearButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("CLEAR", for: .normal)
        return btn
    }()

    private let buttonsView: UIView = {
        let bv = UIView()
        bv.translatesAutoresizingMaskIntoConstraints = false
        return bv
    }()
    
    private var letterButtons: [UIButton]  = {
        let btn = [UIButton(type: .system)]
        return btn
    }()


    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .systemBackground
        let allSubViews = [scoreLabel, clueLabel, answerLabel, currentAnswer, submitButton, clearButton, buttonsView]
        allSubViews.forEach { view.addSubview($0) }


        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),

            clueLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            clueLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 100),
            clueLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),

            answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            answerLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -100),
            answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            answerLabel.heightAnchor.constraint(equalTo: clueLabel.heightAnchor),

            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: clueLabel.bottomAnchor, constant: 20),

            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submitButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 44),

            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clearButton.centerYAnchor.constraint(equalTo: submitButton.centerYAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 44),

            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),

            ])

        let width = 150
        let height = 80

        for row in 0..<4 {
            for col in 0..<5 {
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("WWW", for: .normal)
                
                let frame = CGRect(x: col*width, y: row*height, width: width, height: height)
                letterButton.frame = frame
                
                buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
            }
        }
    }






}


//
//  ViewController.swift
//  AutoLayout
//
//  Created by Heang Ly on 8/13/21.
//

import UIKit

class ViewController: UIViewController {
    private let label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.red
        label.text = "These"
        label.sizeToFit()
        return label
    }()

    private let label2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.cyan
        label.text = "Are"
        label.sizeToFit()
        return label
    }()

    private let label3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.yellow
        label.text = "Are"
        label.sizeToFit()
        return label
    }()


    private let label4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.green
        label.text = "Are"
        label.sizeToFit()
        return label
    }()


    private let label5: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.orange
        label.text = "Are"
        label.sizeToFit()
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground


        var previous: UILabel?

        for label in [label1, label2, label3, label4, label5] {
            view.addSubview(label)
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: view.frame.height/5 - 20).isActive = true

            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            }else{
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }

            previous = label
        }

        label5.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }


}


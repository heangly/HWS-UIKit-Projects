//
//  ViewController.swift
//  Debugging
//
//  Created by Heang Ly on 9/4/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...100 {
            print("Got number \(i)")
        }
    }

    func d(){
        print("d")
    }

}


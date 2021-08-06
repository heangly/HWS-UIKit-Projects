//
//  ViewController.swift
//  GuessTheFlag-ProgrammaticallyUI
//
//  Created by Heang Ly on 8/6/21.
//

import UIKit

class ViewController: UIViewController {
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

    
    var getRandomFlagName: String {
        return countries[Int.random(in: 0..<countries.count)]
    }
    
    private let flag1: UIButton = {
        let flag = UIButton()
      
        return flag
    }()
    
    private let flag2: UIButton = {
        let flag = UIButton()
        return flag
    }()
    
    private let flag3: UIButton = {
        let flag = UIButton()
        return flag
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    func configureUI(){
        view.backgroundColor = .systemBackground

        view.addSubview(flag1)
        flag1.setBackgroundImage(UIImage(named: getRandomFlagName), for: .normal)
        flag1.frame = CGRect(x: 115, y: 120, width: 200, height: 100)
        flag1.layer.borderWidth = 1
        flag1.layer.borderColor = UIColor.lightGray.cgColor


        view.addSubview(flag2)
        flag2.setBackgroundImage(UIImage(named: getRandomFlagName), for: .normal)
        flag2.frame = CGRect(x: 115, y: 270, width: 200, height: 100)
        flag2.layer.borderWidth = 1
        flag2.layer.borderColor = UIColor.lightGray.cgColor
        
        view.addSubview(flag3)
        flag3.setBackgroundImage(UIImage(named: getRandomFlagName), for: .normal)
        flag3.frame = CGRect(x: 115, y: 420, width: 200, height: 100)
        flag3.layer.borderWidth = 1
        flag3.layer.borderColor = UIColor.lightGray.cgColor
    }
    

}

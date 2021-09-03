//
//  ViewController.swift
//  AnimationProgramticallyUI
//
//  Created by Heang Ly on 9/2/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    private let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "penguin"))
        return iv
    }()

    private var currentAnimation: Int = 0 {
        didSet {
            button.setTitle("Animation: \(currentAnimation)", for: .normal)
        }
    }

    private let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Animation: 0", for: .normal)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = .systemBlue
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        btn.titleLabel?.tintColor = .white
        btn.addTarget(self, action: #selector(handleDidTapped), for: .touchUpInside)
        return btn
    }()


    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainUI()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        [imageView, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        let constraints = [
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height / 4),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width / 4),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            button.widthAnchor.constraint(equalToConstant: 200),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    //MARK: - Helpers
    func configureMainUI() {
        view.backgroundColor = .white
    }

    //MARK: - Actions
    @objc func handleDidTapped(sender: UIButton) {
        sender.isHidden = true

        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                switch self.currentAnimation {
                case 0:
                    self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                case 1:
                    self.imageView.transform = .identity
                case 2:
                    self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
                case 3:
                    self.imageView.transform = .identity
                case 4:
                    self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                case 5:
                    self.imageView.transform = .identity
                case 6:
                    self.imageView.alpha = 0.1
                    self.imageView.backgroundColor = UIColor.green
                case 7:
                    self.imageView.alpha = 1
                    self.imageView.backgroundColor = .clear
                default:
                    break
                }
            }) { _ in
            sender.isHidden = false
        }
        
        currentAnimation = currentAnimation > 7 ? 0 : currentAnimation + 1
    }




}


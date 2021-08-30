//
//  ViewController.swift
//  Instafilter-ProgramaticallyUI
//
//  Created by Heang Ly on 8/30/21.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //MARK: - Properties
    private let instaImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .lightGray
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.black.cgColor
        return iv
    }()

    private let intensityLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Intensity: "
        lb.font = UIFont.systemFont(ofSize: 20)
        return lb
    }()

    private let slider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        slider.addTarget(self, action: #selector(sliderDidChangeValue), for: .valueChanged)
        return slider
    }()

    private let changeFilterButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Change Filter", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(changeFilter), for: .touchUpInside)
        return btn
    }()

    private let saveButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Save", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(save), for: .touchUpInside)
        return btn
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainUI()
    }

    //MARK: - Helpers
    func configureMainUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
    }

    //MARK: - Actions
    @objc func changeFilter() {
        print("changeFilter tapped")
    }

    @objc func save() {
        print("save tapped")
    }

    @objc func sliderDidChangeValue(slider: UISlider) {
        print("Slider value change to \(slider.value)")
    }

    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true, completion: nil)
        instaImageView.image = image
    }

    //MARK: - Constraints
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let sliderStack = UIStackView(arrangedSubviews: [intensityLabel, slider])
        sliderStack.axis = .horizontal
        sliderStack.spacing = 20

        [instaImageView, sliderStack, changeFilterButton, saveButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }



        let customConstraints = [
            instaImageView.heightAnchor.constraint(equalToConstant: 420),
            instaImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12),
            instaImageView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            instaImageView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),

            sliderStack.topAnchor.constraint(equalTo: instaImageView.bottomAnchor, constant: 48),
            sliderStack.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -12),
            sliderStack.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 12),

            changeFilterButton.topAnchor.constraint(equalTo: sliderStack.bottomAnchor, constant: 36),
            changeFilterButton.leftAnchor.constraint(equalTo: sliderStack.leftAnchor),
            changeFilterButton.bottomAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor),

            saveButton.topAnchor.constraint(equalTo: changeFilterButton.topAnchor),
            saveButton.rightAnchor.constraint(equalTo: sliderStack.rightAnchor),
            saveButton.bottomAnchor.constraint(equalTo: changeFilterButton.bottomAnchor),

        ]

        NSLayoutConstraint.activate(customConstraints)
    }

}


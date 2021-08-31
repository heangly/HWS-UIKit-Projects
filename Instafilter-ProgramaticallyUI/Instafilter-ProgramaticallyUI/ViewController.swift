//
//  ViewController.swift
//  Instafilter-ProgramaticallyUI
//
//  Created by Heang Ly on 8/30/21.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //MARK: - Properties
    private var context: CIContext!
    private var currentFilter: CIFilter!
    private var intensity: Float = 0.5
    private var currentImage: UIImage!

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
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
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
        let ac = UIAlertController(title: "Choose filter", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }

    @objc func save() {
        guard let image = instaImageView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveImageToAlbum(_: didFinishSavingWithError: contextInfo:)), nil)
    }

    @objc func saveImageToAlbum(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "You alerted image has been saved to your photos", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
    }

    @objc func sliderDidChangeValue(slider: UISlider) {
        intensity = slider.value
        applyProcessing()
    }

    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }

    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(intensity, forKey: kCIInputIntensityKey)
        }

        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(intensity * 200, forKey: kCIInputRadiusKey)
        }

        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(intensity * 10, forKey: kCIInputScaleKey)
        }

        if inputKeys.contains(kCIInputCenterKey) {
            currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2), forKey: kCIInputCenterKey)
        }

        if let cgimg = context.createCGImage(currentFilter.outputImage!, from: currentFilter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            instaImageView.image = processedImage
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true, completion: nil)
        instaImageView.image = image
        currentImage = image
    }

    func setFilter(action: UIAlertAction) {
        guard currentImage != nil else { return }
        guard let actionTitle = action.title else { return }
        
        currentFilter = CIFilter(name: actionTitle)
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    //MARK: - Constraints
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let sliderStack = UIStackView(arrangedSubviews: [intensityLabel, slider])
        sliderStack.axis = .horizontal
        sliderStack.spacing = 20
        sliderStack.distribution = .fill

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

            intensityLabel.heightAnchor.constraint(equalToConstant: 50),

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


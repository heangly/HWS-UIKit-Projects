//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Heang Ly on 8/2/21.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedImage: String?
    var totalNumberOfImage: Int?
    var imageNumber: Int?

    @IBOutlet var imageView: UIImageView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else { return }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        present(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))



        if let selectedImage = selectedImage,
            let totalNumberOfImage = totalNumberOfImage,
            let imageNumber = imageNumber {
            title = "Picture \(imageNumber + 1) of \(totalNumberOfImage)"
            imageView.image = UIImage(named: selectedImage)
            imageView.contentMode = .scaleAspectFill
        }
    }




}

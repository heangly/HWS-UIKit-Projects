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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        if let selectedImage = selectedImage,
            let totalNumberOfImage = totalNumberOfImage,
            let imageNumber = imageNumber {
            title = "Picture \(imageNumber + 1) of \(totalNumberOfImage)"
            imageView.image = UIImage(named: selectedImage)
            imageView.contentMode = .scaleAspectFill
        }
    }




}

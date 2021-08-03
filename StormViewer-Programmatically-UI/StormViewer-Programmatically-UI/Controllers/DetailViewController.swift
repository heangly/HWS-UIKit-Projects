//
//  DetailView.swift
//  StormViewer-Programmatically-UI
//
//  Created by Heang Ly on 8/3/21.
//


import UIKit

class DetailViewController: UIViewController {
    var selectedImage: String?
    var currentImageNumber: Int?
    var totalImageNumber: Int?
    
    private let imageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 800))
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    //MARK: - Actions
    func configureUI() {
        navigationItem.largeTitleDisplayMode = .never
        if let selectedImage = selectedImage,
            let currentImageNumber = currentImageNumber,
            let totalImageNumber = totalImageNumber {
            title = "Picture \(currentImageNumber) of \(totalImageNumber)"
            imageView.image = UIImage(named: selectedImage)
        }
        view.addSubview(imageView)
        
    }
}

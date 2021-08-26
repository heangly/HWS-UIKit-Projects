//
//  PersonCell.swift
//  NamesToFace-ProgramticallyUI
//
//  Created by Heang Ly on 8/23/21.
//

import UIKit



class PersonCell: UICollectionViewCell {
    var name: String? {
        didSet {
            nameLabel.text = name!
        }
    }
    
    var imagePath: String? {
        didSet {
            imageView.image = UIImage(contentsOfFile: imagePath!)
        }
    }

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .white
        iv.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        iv.layer.cornerRadius = 3
        iv.layer.borderWidth = 2
        return iv
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Marker Felt", size: 16)
        label.text = "label"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }

    func configureCell() {
        backgroundColor = .systemBackground
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 134).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}




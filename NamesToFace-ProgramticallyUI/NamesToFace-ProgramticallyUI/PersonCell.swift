//
//  PersonCell.swift
//  NamesToFace-ProgramticallyUI
//
//  Created by Heang Ly on 8/23/21.
//

import UIKit

class PersonCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Marker Felt", size: 16)
        label.text = "label"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }

    func configureCell() {

        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




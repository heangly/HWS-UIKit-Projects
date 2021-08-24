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
        iv.backgroundColor = .white
        return iv
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Marker Felt", size: 16)
        label.textColor = .black
        label.text = "label"
        label.backgroundColor = .cyan
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }

    func configureCell() {
        backgroundColor = .systemPink
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




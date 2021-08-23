//
//  ViewController.swift
//  NamesToFaces
//
//  Created by Heang Ly on 8/23/21.
//

import UIKit

class ViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as! PersonCell
        cell.nameLabel.text = "hello"
        return cell
    }
}


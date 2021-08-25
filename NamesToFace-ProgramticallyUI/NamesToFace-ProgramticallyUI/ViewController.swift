//
//  ViewController.swift
//  NamesToFace-ProgramticallyUI
//
//  Created by Heang Ly on 8/23/21.
//

import UIKit

private let reuseableCellID = "Person"

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainUI()
    }

    func configureMainUI(){
        title = "Names To Face"
        collectionView.backgroundColor = .black
//        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: reuseableCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableCellID, for: indexPath) as! PersonCell
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = 140
        let height = 180
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 101, right: 10)
    }
}

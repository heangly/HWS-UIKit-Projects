//
//  ViewController.swift
//  NamesToFace-ProgramticallyUI
//
//  Created by Heang Ly on 8/23/21.
//

import UIKit

private let reuseableCellID = "Person"

class ViewController: UICollectionViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainUI()
        
        let defaults = UserDefaults.standard
        if let savedPeople = defaults.object(forKey: "people") as? Data {
            let decoder = JSONDecoder()
            
            do {
                people = try decoder.decode([Person].self, from: savedPeople)
            } catch  {
                print("Failed to load people \(error.localizedDescription)")
            }
        }
    }

    func configureMainUI() {
        title = "Names To Face"
        collectionView.backgroundColor = .black
//        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: reuseableCellID)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
    }

    //MARK: - Actions
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableCellID, for: indexPath) as! PersonCell
        let person = people[indexPath.row]
        let path = getDocumentDirectory().appendingPathComponent(person.image)

        cell.name = person.name
        cell.imagePath = path.path
        cell.layer.cornerRadius = 7
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        let ac = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addAction(UIAlertAction(title: "ok", style: .default) { [weak self, weak ac] _ in
                guard let newName = ac?.textFields?[0].text else { return }
                person.name = newName
                self?.collectionView.reloadData()
                self?.save()
            })
        present(ac, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        let imageName = UUID().uuidString
        let imagePath = getDocumentDirectory().appendingPathComponent(imageName)

        if let jpegeData = image.jpegData(compressionQuality: 0.8) {
            try? jpegeData.write(to: imagePath)
        }

        let person = Person(name: "unknwon", image: imageName)
        people.append(person)

        collectionView.reloadData()
        save()
        dismiss(animated: true)
    }

    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func save() {
        let encoder = JSONEncoder()
        if let savedData = try? encoder.encode(people) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        } else {
            print("Failed to save people.")
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 140
        let height = 180
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 101, right: 10)
    }
}

//
//  ViewController.swift
//  StormViewer-Programmatically-UI
//
//  Created by Heang Ly on 8/1/21.
//

import UIKit

let imageCellIdentifier = "Image Cell"

class ViewController: UITableViewController {
    var images = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllImageNames()
        configureTableView()
    }
    
    //MARK: - Helpers
    func getAllImageNames(){
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                images.append(item)
            }
        }
    }

    //MARK: - ConfigureTableView
    func configureTableView(){
        view.backgroundColor = .white
        tableView.register(ImageCell.self, forCellReuseIdentifier: imageCellIdentifier)
    }
    
    //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: imageCellIdentifier, for: indexPath)
        cell.textLabel?.text = images[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


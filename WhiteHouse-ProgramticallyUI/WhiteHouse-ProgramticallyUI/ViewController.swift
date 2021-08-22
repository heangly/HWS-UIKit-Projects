//
//  ViewController.swift
//  WhiteHouse-ProgramticallyUI
//
//  Created by Heang Ly on 8/15/21.
//

import UIKit

class ViewController: UITableViewController {
    var petitons = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        tableView?.register(MainCell.self, forCellReuseIdentifier: "Cell")
        fetchData()
    }

    func fetchData() {
        let urlString: String

        if navigationController?.tabBarItem.tag == 1 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }

        DispatchQueue.global(qos: .userInteractive).async {
            if let url = URL(string: urlString) {
                let urlSession = URLSession.shared.dataTask(with: url) { (data, reponse, error) in
                    if let error = error {
                        print("DEBUG: error fetching data \(error.localizedDescription)")
                    }

                    if let data = data {
                        self.parse(jsonData: data)
                    }
                }
                urlSession.resume()
            }
        }


    }

    func parse(jsonData: Data) {
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(Petitions.self, from: jsonData)
            petitons = data.results
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        } catch {
            print("Cannot convert data to json \(error.localizedDescription)")
        }

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitons.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        cell.textLabel?.text = petitons[indexPath.row].title
        cell.detailTextLabel?.text = petitons[indexPath.row].body
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitons[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }


}


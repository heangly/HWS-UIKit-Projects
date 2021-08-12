//
//  ViewController.swift
//  WordScamble-ProgramticallyUI
//
//  Created by Heang Ly on 8/12/21.
//

import UIKit

let reusuableIdentifier = "Cell"

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadText()
        configureUI()
        startGame()
    }

    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        registerCell()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addText))
    }

    func loadText() {
        guard let textUrl = Bundle.main.url(forResource: "start", withExtension: "txt") else { return }
        guard let texts = try? String(contentsOf: textUrl) else { return }
        allWords = texts.components(separatedBy: "\n")

        if allWords.isEmpty {
            allWords = ["milk"]
        }
    }

    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    func submitAnswer(_ answer: String){
        usedWords.insert(answer, at: 0)
        tableView.reloadData()
    }

    //MARK: - Action
    @objc func addText() {
        let ac = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let action = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submitAnswer(answer)
        }
        ac.addAction(action)
        present(ac, animated: true, completion: nil)
    }
    

    //MARK: - Table View Configuration
    func registerCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reusuableIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusuableIdentifier, for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            usedWords.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}



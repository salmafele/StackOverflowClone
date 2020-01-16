//
//  ViewController.swift
//  SF_StackOverflowClone
//
//  Created by Salma on 1/11/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func dropDownMenu(_ sender: Any) {
           
    }
    
    var questionResult = [Question]()
    let builder = URLBuilder()
    
    
    // MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        // tableView Delegate and dataSource
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        
        let url = builder.search(search: "TableView Programmatically")

        let network = StackNetworking()
        network.load(urlString: url) { (data) in
            print(String(data: data, encoding: .utf8)!)

            let stackParser = StackParser()
            stackParser.parse(data: data) { (stackData) in
                self.questionResult = stackData.items

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toResultWindow", sender: nil)
    }
    
 // TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell") as? ResultCell else { return UITableViewCell() }
        
        let question = questionResult[indexPath.row]
        cell.textLabel?.text = question.title
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
}

//
//  QuestionViewController.swift
//  SF_StackOverflowClone
//
//  Created by Salma on 1/13/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var questionResult = [Question]()
    let builder = URLBuilder()
    
    @IBOutlet weak var questionBy: UILabel!
    @IBOutlet weak var postedDate: UILabel!
    @IBOutlet weak var askingImageView: UIImageView!
    @IBOutlet weak var askingRank: UILabel!
    @IBAction func questionVoteUp(_ sender: Any) {
    }
    @IBAction func questionVoteDown(_ sender: Any) {
    }
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var questionReview: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
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

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "answersCell") as? AnswerCell else { return UITableViewCell() }
        
        let question = questionResult[indexPath.row]
        cell.answerLabel.text = question.body
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionResult.count
    }
}


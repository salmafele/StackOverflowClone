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

        
        
    }

}


//
//  AnswerCell.swift
//  SF_StackOverflowClone
//
//  Created by Salma on 1/15/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak var answeredBy: UILabel!
    @IBOutlet weak var answerDate: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerImage: UIImageView!
    @IBAction func voteUpButton(_ sender: Any) {
    }
    @IBAction func voteDownButton(_ sender: Any) {
    }
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    // MARK: LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundImage()
    }
    
    func roundImage() {
        answerImage.layer.cornerRadius = 20
        answerImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

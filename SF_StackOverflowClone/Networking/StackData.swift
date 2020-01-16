//
//  StackData.swift
//  SF_StackOverflowClone
//
//  Created by Salma on 1/13/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import Foundation

struct StackData: Codable {
    var items: [Question]
}

struct Question: Codable {
    var question_id: Int
    var title: String
    var accepted_answer_id: Int?
    var body: String?
}

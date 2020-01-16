//
//  URLBuilder.swift
//  SF_StackOverflowClone
//
//  Created by Salma on 1/14/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import UIKit

class URLBuilder {
    
    // for search questions
    let url = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&site=stackoverflow&intitle="
    
    // for answers
    let answer = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&site=stackoverflow&intitle="

    func search(search: String) -> String {
        let encodedString = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        return "\(url)\(encodedString)"
    }
}

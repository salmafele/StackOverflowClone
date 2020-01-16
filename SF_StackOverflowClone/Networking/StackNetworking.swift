//
//  StackNetworking.swift
//  SF_StackOverflowClone
//
//  Created by Salma on 1/14/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import UIKit

class StackNetworking {

    func load(urlString: String, completed: @escaping (Data) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            completed(data)
        }
        task.resume()
    }
}

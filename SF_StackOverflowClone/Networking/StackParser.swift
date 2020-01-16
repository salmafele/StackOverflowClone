//
//  StackParser.swift
//  SF_StackOverflowClone
//
//  Created by Salma on 1/13/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import Foundation

class StackParser {

    func parse(data: Data, completed: (StackData) -> Void) {
    
    let jsonDecoder = JSONDecoder()
    
        do {
            let stackData = try jsonDecoder.decode(StackData.self, from: data)
            completed(stackData)
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}

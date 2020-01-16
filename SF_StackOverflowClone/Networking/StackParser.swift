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
        DispatchQueue.global(qos: .background).async {
            
            do {
                let jsonDecoder = jsonDecoder()
                let stackData = try jsonDecoder.decode(StackData.self, from: data)
                completed(stackData)
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
}

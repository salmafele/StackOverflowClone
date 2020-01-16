//
//  StackNetworkManager.swift
//  SF_StackOverflowClone
//
//  Created by Salma on 1/16/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import UIKit

class StackNetworkManager {
    
    private enum API {
        
        static let baseURL = URL(string: "https://api.stackexchange.com/")
        
    }
    
    static let shared = StackNetworkManager()
    
    private init() {}
    
    func data(urlString: String, completed: @escaping (Data) -> Void) {
        guard let url = URL(string: urlString) else { return }
               
               let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                   
                   guard let data = data else { return }
                   print("Response URL: \(response?.url)")
                   completed(data)
               }
               task.resume()
           }
           
           static func getRecentQuestions(fromDate: Int, toDate: Int, completion: @escaping (Data?, Error?) -> Void) {
               
               let pathParams = ["2.2/", "questions"]
               let queryParams = ["fromdate": "\(fromDate)",
                                  "todate": "\(toDate)",
                                  "order": "desc",
                                  "sort": "activity",
                                  "site": "stackoverflow",
                                  "filter": "!9X(-vwYGT"]
               
               
               StackNetworkManager.makeRequest(url: API.baseURL!, appendingPath: pathParams, queries: queryParams) { (data, errors) in
                   // do nothing for now
               }
           }
           
           static func makeRequest(method: String = "GET", url: URL, appendingPath: [String], queries: [String:String] = [:], completion: @escaping (Data?, Error?) -> Void) {
               
               var url = url
               for path in appendingPath {
                   url.appendPathComponent(path)
               }
               
               var queryArray = [URLQueryItem]()
               for query in queries {
                   queryArray.append(URLQueryItem(name: query.key, value: query.value))
               }
               
               var urlComponents = URLComponents()
               urlComponents.scheme = url.scheme
               urlComponents.host = url.host
               urlComponents.path = url.path
               if queryArray.count > 0 {
                   urlComponents.queryItems = queryArray
               }
              
               guard let finalURL = urlComponents.url else {
                   NSLog("Constructing the URL has failed.")
                   return
               }
               print("finalURL: ", finalURL)
               
               var request = URLRequest(url: finalURL)
               request.httpMethod = method
    }

}

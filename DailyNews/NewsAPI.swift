//
//  NewsAPI.swift
//  Daily News
//
//  Created by Adebayo Oriyomi on 2019-09-28.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import Foundation
import Alamofire

enum NewsAPI {
    static var baseURL = URLComponents(string: "https://newsapi.org")
    static let apiToken = "8e58842e74f2453bb5e6e3845b386a81"
    static let sourceUrl = "https://newsapi.org/v2/sources?language=en&apiKey=\(NewsAPI.apiToken)"
    
    static func getNewsArticles(newsId: String, completionHandler: @escaping (Articles) -> ()) {
        print("This is newsId \(newsId)")
        var url:String?
        if newsId == "All" {
            url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(NewsAPI.apiToken)"
        } else {
            url = "https://newsapi.org/v2/top-headlines?sources=\(newsId)&apiKey=\(NewsAPI.apiToken)"
        }
        AF.request(url!).responseDecodable(of: Articles.self) { response in
            switch response.result {
            case .success(let data):
                
                print(data)
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(data)
                })
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func loadSources(completionHandler: @escaping (Publisher) -> ()) {
        let urlString = sourceUrl
        print(urlString)
        
        if let url = URL.init(string: urlString){
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let publishers = try? JSONDecoder().decode(Publisher.self, from: data!) {
                    completionHandler(publishers)
                }
            })
            task.resume()
        }
    }
}






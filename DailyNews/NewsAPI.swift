//
//  NewsAPI.swift
//  Daily News
//
//  Created by Adebayo Oriyomi on 2019-09-28.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit


enum NewsAPI {
    static var baseURL = URLComponents(string: "https://newsapi.org")
    static let apiToken = "8e58842e74f2453bb5e6e3845b386a81"
    
    
    static func getNewsArticles() -> Promise<Articles> {
        return Promise { seal in
            let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(NewsAPI.apiToken)"
            AF.request(url)
                .validate()
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        do{
                        let jsonFromData = try JSONDecoder().decode(Articles.self, from: data)
                            seal.fulfill(jsonFromData)
                        }catch{
                            seal.reject(error)
                        }
                        
                    case .failure(let error):
                        seal.reject(error)
                    }
            }
        }
    }
}




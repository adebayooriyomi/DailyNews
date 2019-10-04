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
    
    
//    static func getNewsArticles(){
//        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiToken)"
//        AF.request(url).responseJSON { response in
//            //debugPrint(response)
//            print(response)
//
//        }
//    }
    
    static func getNewsArticles() ->  Promise<Articles> {
        return Promise { seal in
            let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(NewsAPI.apiToken)"
            AF.request(url)
                .validate()
                .responseData { response in
                    
                    switch response.result {
                    case .success(let data):
//                        guard let data = data as? Articles else {
//                            return seal.reject(AFError.responseValidationFailed(reason: .dataFileNil))
//                        }
                        
                        //print("json from API++++++++++++++++++++++++++++++++++")
                        //print(json)
                        do{
                        let jsonFromData =  try JSONDecoder().decode(Articles.self, from: data)
                            //print(jsonFromData)
                            seal.fulfill(jsonFromData)
                        }catch{
                            seal.reject(error)
                        }
                        //seal.fulfill(jsonFromData)
                        
                       // seal.fulfill(json)
                        
                    case .failure(let error):
                        seal.reject(error)
                    }
            }
        }
    }
    
}




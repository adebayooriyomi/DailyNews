//
//  FeedModel.swift
//  Daily News
//
//  Created by Adebayo Oriyomi on 2019-09-29.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import Foundation


struct Articles: Decodable {
    var articles: [DailyFeedModel]
}

//Data Model
struct DailyFeedModel: Codable {
    
    public var title: String = ""
    public var author: String?
    public var publishedAt: String?
    public var urlToImage: String?
    public var articleDescription: String?
    public var url: String?
    public var source: Source?
    
    enum CodingKeys: String, CodingKey {
        case articleDescription = "description"
        case title, author, publishedAt, urlToImage, url, source
    }
}

struct Source: Codable {
    public var name: String?
    public var id: String?
}


struct Publisher: Decodable {
    var sources: [PublisherModel]
}

//Data Model
struct PublisherModel: Codable {
    
    var id: String?
    var name: String?
    var url: String?
    var category: String?
    var urlToLogo: String?
    var sortBysAvailable: String?

}


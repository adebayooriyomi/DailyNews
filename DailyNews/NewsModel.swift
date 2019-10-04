//
//  FeedModel.swift
//  Daily News
//
//  Created by Adebayo Oriyomi on 2019-09-29.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import Foundation


struct Articles: Codable {
    var articles: [DailyFeedModel]
}

//Data Model
final class DailyFeedModel: NSObject, Codable {
    
    public var title: String = ""
    public var author: String?
    public var publishedAt: String?
    public var urlToImage: String?
    public var articleDescription: String?
    public var url: String?
    
    private enum CodingKeys: String, CodingKey {
        case articleDescription = "description"
        case title, author, publishedAt, urlToImage, url
    }
}

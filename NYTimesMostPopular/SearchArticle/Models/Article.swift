//
//  Article.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Foundation

class Article: Codable {
    let id: Int?
    let title: String?
    let abstract: String?
    let type: String?
    let publishedDate: String?
    let byline: String?
    let media: [Media]?
    let url: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case abstract
        case type
        case publishedDate = "published_date"
        case byline
        case media
        case url
    }
}

class Media: Codable {
    let caption: String?
    let metadata: [MediaMetadata]?

    private enum CodingKeys: String, CodingKey {
        case caption
        case metadata = "media-metadata"
    }
}

class MediaMetadata: Codable {
    let url: String?
}

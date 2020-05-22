//
//  Storyboard.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Foundation

struct StoryboardName {
    static let searchStoryboard = "Search"
}

struct StoryboardIdentifire {
    // Search Storyboard
    static let searchArticleView = "SearchArticleViewController"
    static let articleDetailsView = "ArticleDetailsViewController"
    static let fullArticleView = "FullArticleViewController"
}

struct Storyboard {
    let name: String
    let identifire: String?
}

struct StoryboardMapper {
    struct Search {
        static let search = Storyboard(name: StoryboardName.searchStoryboard, identifire: StoryboardIdentifire.searchArticleView)
        static let articleDetails = Storyboard(name: StoryboardName.searchStoryboard, identifire: StoryboardIdentifire.articleDetailsView)
        static let fullArticle = Storyboard(name: StoryboardName.searchStoryboard, identifire: StoryboardIdentifire.fullArticleView)
    }
}

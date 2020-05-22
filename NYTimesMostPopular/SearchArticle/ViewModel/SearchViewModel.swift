//
//  SearchViewModel.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Foundation

class SearchViewModel {
    let articleCellIdentifire = "ArticleCell"
    var articles: [Article]?

    func getMostViewedArticles(complition: @escaping (_ error: CustomError?) -> Void) {
        let parameters = SearchArticleRequstParameters()

        let searchApi = SearchApi()
        searchApi.params = parameters
        searchApi.period = "1"
        searchApi.search().get { [weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.articles = response.results
            complition(nil)
        }.catch { error in
            complition(error as? CustomError)
        }
    }
}

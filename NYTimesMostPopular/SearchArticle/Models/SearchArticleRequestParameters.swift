//
//  SearchArticleRequestParameters.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Foundation

class SearchArticleRequstParameters: RequestParamters {
    let apiKey = Configurations.api_Key

    private enum CodingKeys: String, CodingKey {
        case apiKey = "api-key"
    }
}

//
//  SearchApi.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Alamofire
import PromiseKit

class SearchApi: Api {
    var period: String?
    enum APIRouter: Requestable {
        case search(SearchApi)

        var versoin: String? {
            return "/v2"
        }

        var module: String? {
            switch self {
            case .search: return "/mostpopular"
            }
        }

        var path: String {
            switch self {
            case let .search(api):
                return "/viewed/\(api.period!).json"
            }
        }

        var baseUrl: URL {
            return Configurations.rootUrl
        }

        var method: HTTPMethod {
            switch self {
            case .search:
                return .get
            }
        }

        var parameters: Parameters? {
            switch self {
            case let .search(api):
                return api.params?.getParamsAsJson()
            }
        }
    }
}

extension SearchApi {
    func search() -> Promise<SearchArticleResponse> {
        return fireRequestWithSingleResponse(requestable: APIRouter.search(self))
    }
}

//
//  ServiceManager.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import UIKit

import Alamofire

typealias JSON = [String: Any]
typealias RequestCompletion = (_ response: Any?, _ error: Error?) -> Swift.Void

class ServiceManager {
    static let shared = ServiceManager()

    var manager: Alamofire.SessionManager
    var requestsDictionary: [String: [DataRequest]]!

    private init() {
        // manager
        manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)

        manager.adapter = ServiceAdapter()
        requestsDictionary = [String: [DataRequest]]()
    }

    func request(_ urlRequest: URLRequestConvertible, requestID: String = "") -> DataRequest {
        let request = manager.request(urlRequest)
        if requestsDictionary[requestID] != nil {
            var requestsWithSameId = requestsDictionary[requestID]
            requestsWithSameId!.append(request)
        } else {
            requestsDictionary[requestID] = [request]
        }
        return request
    }

    func cancelRequestWithID(requestID: String) {
        if let requestsWithSameId = requestsDictionary[requestID] {
            _ = requestsWithSameId.map { $0.cancel() }
        }
    }

    func cancelAllRequests() {
        for requests in requestsDictionary.values {
            _ = requests.map { $0.cancel() }
        }
    }
}

extension ServiceManager {
    class ServiceAdapter: RequestAdapter {
        func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
            var urlRequest = urlRequest

            // update default http headers
            urlRequest.allHTTPHeaderFields?.merge(Alamofire.SessionManager.defaultHTTPHeaders) { current, _ in current }

            // customize
            return urlRequest
        }
    }
}

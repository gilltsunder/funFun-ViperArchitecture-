//
//  Router.swift
//  funFun
//
//  Created by Vlad Tretiak on 05/05/2021.
//

import Foundation
//https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=bMihebs1FBqcX9hR9LvOsApOUDDlS2Gi
//https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=bMihebs1FBqcX9hR9LvOsApOUDDlS2Gi
//https://api.nytimes.com/svc/mostpopular/v2/shared/{period}/{share_type}.json


enum Router {
    
    case mostEmailed
    case getQueryPhotos(query: String)
    
//    var header: [String: String] {
//        return ["Authorization": "Client-ID JGD5GC3L-KHTzcUlFAgFs7wLNNIkJ_8WRACcia4uLZk"]
//    }
    
    var scheme: String {
        switch self {
        case .mostEmailed, .getQueryPhotos:
            return "https"
        }
    }
    
    var host: String {
        let base = "api.nytimes.com"
        switch self {
        case .mostEmailed, .getQueryPhotos:
            return base
        }
    }
    
    var path: String {
        switch self {
        case .mostEmailed:
            return "/svc/mostpopular/v2/emailed/30.json"
        case .getQueryPhotos:
            return "/search/photos"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .mostEmailed:
            return [URLQueryItem(name: "api-key", value: "bMihebs1FBqcX9hR9LvOsApOUDDlS2Gi")]
        case .getQueryPhotos(let query):
            return [URLQueryItem(name: "query", value: query),
                    URLQueryItem(name: "page", value: String(1)),
                    URLQueryItem(name: "per_page", value: String(30))]
        }
    }
    
    var method: String {
        switch self {
        case .mostEmailed, .getQueryPhotos:
            return "GET"
        }
    }
}

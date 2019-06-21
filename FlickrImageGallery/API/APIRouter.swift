//
//  APIRouter.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "get"
    
    var value: String {
        return self.rawValue
    }
}

enum APIRouter {
    
    case getPublicFeeds
}

extension APIRouter: URLRequestConvertible {
    
    typealias Parameters = [String: Any]
    
    private var baseURL: String {
        
        guard let infoDictPath = Bundle.main.path(forResource: "Info", ofType: "plist") else { return "" }
        let aDictionary = NSDictionary(contentsOfFile: infoDictPath) as? [String : AnyObject]
        return (aDictionary?["baseURL"] != nil) ?  aDictionary?["baseURL"] as! String  : ""
    }
    
    private var method: HttpMethod {
        switch self {
        case .getPublicFeeds:
            return .get
        }
    }
    
    func asURLRequest() -> URLRequest {
        
        var urlRequest = URLRequest(url: URL.init(string: baseURL)!)
        urlRequest.httpMethod = method.value
        
        return urlRequest
    }
}

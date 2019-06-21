//
//  APIManager.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import SystemConfiguration

final class APIManager {
    
    static func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        if flags.isEmpty {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    @discardableResult
    static func getItunesSearchList(term: String, entity: String = "",completionHandler:@escaping (Bool, Result<FlikrFeedModel,HDError>) -> Void) -> URLSessionDataTask {
        return APIClient.shared.dataRequest(router: .getPublicFeeds, completionHandler: completionHandler)
    }
}


//
//  APIConstants.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

enum HDError: Error {
    
    case invalidURL
    case clientSideError
    case serverSideError
    case jsonSerializing(String)
    case errorjsonSerializing(String)
    case jsonEncoding
}

protocol URLRequestConvertible {
    /// Returns a URL request or throws if an `Error` was encountered.
    ///
    /// - throws: An `Error` if the underlying `URLRequest` is `nil`.
    ///
    /// - returns: A URL request.
    func asURLRequest() -> URLRequest
}

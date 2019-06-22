//
//  APIClient.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

final class APIClient {
    static let shared = APIClient()
    private let session = URLSession.shared
    
    func dataRequest<M: Codable>(router: APIRouter, completionHandler:@escaping (_ success: Bool, _ result: Result<M,HDError>)->Void) -> URLSessionDataTask {
        
        let dataTask = session.dataTask(with: router.asURLRequest()) { (data, response, error) in
            
            guard let data = data else {
                completionHandler(false, Result.failure(HDError.clientSideError))
                return
            }
            
            do {
                
                
                let jsonResponse = try JSONDecoder().decode(M.self, from: self.removeTheUnwantedTextFromTheJson(data: data))
                completionHandler(true, Result.success(jsonResponse))
                
            } catch (let error) {
                
                completionHandler(false, Result.failure(HDError.jsonSerializing(error.localizedDescription)))
            }
            
        }
        dataTask.resume()
        return dataTask
    }
    
    
    func removeTheUnwantedTextFromTheJson(data: Data) -> Data {
        
        let invalidJsonString = String.init(data: data, encoding: .utf8)
        let newdata: Data = invalidJsonString?.dropFirst("jsonFlickrFeed(".count).dropLast().data(using: .utf8) ?? Data()
        return newdata
    }
}

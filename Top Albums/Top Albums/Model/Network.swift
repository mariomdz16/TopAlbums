//
//  Network.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import Foundation

// MARK: - Network

final class Network {
    
    // MARK: - Class Methods
    
    static func makeRequest<T: Decodable>(forUrl url: URL,
                                          type: T.Type,
                                          completionHandler: @escaping (T?, NetworkError?) -> Void) {
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode != 200 {
                completionHandler(nil, .requestError)
                return
            }
            
            do {
                if let jsonData = data {
                    let decoder = JSONDecoder()
                    let typedObject: T? = try decoder.decode(T.self, from: jsonData)
                    completionHandler(typedObject, nil)
                }
            } catch {
                debugPrint("Error: \(error.localizedDescription)")
                completionHandler(nil, .parseError)
            }
        }
        
        dataTask.resume()
    }
    
    static func getAlubmImage(forUrl url: URL,
                              completionHandler: @escaping (Data?, NetworkError?) -> Void) {
        let queue = OperationQueue()
        queue.qualityOfService = .userInitiated
        queue.addOperation {
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                if let statusCode = (response as? HTTPURLResponse)?.statusCode,
                    statusCode != 200,
                    error == nil {
                    completionHandler(nil, .requestError)
                    return
                }
                
                if let imageData = data {
                    completionHandler(imageData, nil)
                }
            }
            
            dataTask.resume()
        }
    }
}

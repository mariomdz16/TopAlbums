//
//  WebServices.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import Foundation
import UIKit

// MARK: - WebService

class WebService {
    
    // MARK: - Class Methods
    
    static func loadAlbums(completionHandler: @escaping (Event?, Bool?) -> Void) {
        guard let url = URL(string: Constants.albumsUrlString) else {
            completionHandler(nil, false)
            return
        }
        Network.makeRequest(forUrl: url, type: AlbumsResponse.self) { (response, error) in
            guard error == nil else {
                completionHandler(nil, false)
                return
            }
            
            let event = Event()
            event.albums = response?.feed?.results ?? []
            completionHandler(event, true)
        }
    }
    
    static func loadAlbumImage(forUrl url: URL,
                               completionHandler: @escaping (Data?, Bool?) -> Void) {
        Network.getAlubmImage(forUrl: url) { (imageData, error) in
            guard error == nil else {
                completionHandler(nil, false)
                return
            }
            
            completionHandler(imageData, true)
        }
    }
}

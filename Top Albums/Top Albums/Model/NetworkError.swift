//
//  NetworkError.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import Foundation

// MARK: - NetworkError

enum NetworkError: Error {
    
    // MARK: - Cases
    
    case parseError
    case requestError
}

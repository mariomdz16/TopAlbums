//
//  AlbumsResponse.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import Foundation

// MARK: - AlbumsResponse Model

struct AlbumsResponse: Decodable {
    var feed: Feed?
}

// MARK: - Feed Model

struct Feed: Decodable {
    var title: String?
    var id: String?
    var author: Author?
    var links: [Dictionary<String, String>]?
    var copyright: String?
    var country: String?
    var icon: String?
    var updated: String?
    var results: [Album]?
}

// MARK: - Author Model

struct Author: Decodable {
    var name: String?
    var url: String?
}


//
//  Genre.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import Foundation

// MARK: - Genre Model

struct Genre: Decodable {
    var genreId: String?
    var name: String?
    var url: String?
}

// MARK: - CustomStringConvertible Protocol

extension Genre: CustomStringConvertible {
    var description: String {
        "\(name ?? Constants.textPlaceholder)"
    }
}

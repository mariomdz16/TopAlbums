//
//  Album.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import Foundation

// MARK: - Album Model

struct Album: Decodable {
    var artistName: String?
    var id: String?
    var releaseDate: String?
    var name: String?
    var kind: String?
    var copyright: String?
    var artistId: String?
    var contentAdvisoryRating: String?
    var artistUrl: String?
    var artworkUrl100: String?
    var genres: [Genre]?
    var url: String?
    var imageData: Data?
}

// MARK: - CustomStringConvertible Protocol

extension Album: CustomStringConvertible {
    var description: String {
        """
        Name: \(name ?? Constants.textPlaceholder)
        Artist: \(artistName ?? Constants.textPlaceholder)
        Genres: \(allGenres())
        Realesed: \(formattedDate())
        
        \(copyright ?? Constants.textPlaceholder)
        """
    }
    
    func formattedDate() -> String {
        guard let releaseDate = releaseDate,
            let date = Constants.DateFormatters.defaultDateFormatter.date(from: releaseDate) else {
                return Constants.textPlaceholder
        }
        
        return Constants.DateFormatters.displayDateFormatter.string(from: date)
    }
    
    func allGenres() -> String {
        guard let genres = genres, !genres.isEmpty else {
            return Constants.textPlaceholder
        }
        var genresDescription = ""
        
        for index in 0..<genres.count {
            genresDescription += genres[index].description
            if index < (genres.count - 1) {
                genresDescription += ", "
            }
        }
        
        return genresDescription
    }
}

// MARK: Equatable Protocol

extension Album: Equatable {
    static func == (lhs: Album, rhs: Album) -> Bool {
        lhs.description == rhs.description
    }
}


//
//  Constants.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import Foundation
import UIKit

// MARK: Constants

public struct Constants {
    
    // MARK: - URLs
    
    static let albumsUrlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"

    // MARK: - Placeholders

    static let textPlaceholder = "--"
    

    // MARK: - Padding

    static let padding5: CGFloat = 5
    static let padding8: CGFloat = 8
    static let padding10: CGFloat = 10
    static let padding20: CGFloat = 20

    // MARK: - DateFormatters
    
    struct DateFormatters {
        /// Format: "yyyy-MM-dd"
        static let defaultDateFormatter: DateFormatter = {
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter
        }()

        /// Format: "MMM dd, yyyy"
        static let displayDateFormatter: DateFormatter = {
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            return dateFormatter
        }()
    }
}

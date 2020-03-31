//
//  AlbumCellTests.swift
//  Top AlbumsTests
//
//  Created by Mario A Mendez on 3/29/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import XCTest
@testable import Top_Albums

class AlbumCellTests: XCTestCase {
    var albumCell = AlbumCell()
    var album = Album(artistName: "artist name", name: "album name")

    override func setUp() {
        albumCell.album = album
    }

    func testTitleLabel() {
        XCTAssert(albumCell.albumTitleLabel.text == album.name, "Album name text should be the same")
    }

    func testArtistLabel() {
        XCTAssert(albumCell.albumArtistLabel.text == album.artistName, "Artist name text should be the same")
    }
}

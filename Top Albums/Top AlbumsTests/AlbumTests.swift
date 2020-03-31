//
//  AlbumTests.swift
//  Top AlbumsTests
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import XCTest
@testable import Top_Albums

class AlbumTests: XCTestCase {
    var album1 = Album(artistName: "artist1", name: "album name")
    var album1Copy = Album(artistName: "artist1", name: "album name")
    var album2 = Album(artistName: "artist2", name: "album name")


    func testEquality() {
        XCTAssert(album1 == album1Copy, "Album models should be equal")
        XCTAssert(album1 != album2, "Album models should not be equal")
    }

}

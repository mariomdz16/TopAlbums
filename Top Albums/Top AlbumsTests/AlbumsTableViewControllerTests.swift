//
//  AlbumTableViewControllerTests.swift
//  Top AlbumsTests
//
//  Created by Mario A Mendez on 3/29/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import XCTest
@testable import Top_Albums

class AlbumsTableViewControllerTests: XCTestCase {
    var albumsTableViewController = AlbumsTableViewController()
    var event = Event()
    let totalAlbums = 10

    override func setUp() {
        var albumsArray = [Album]()
        albumsTableViewController.loadViewIfNeeded()

        for _ in 0..<totalAlbums {
            albumsArray.append(Album(artistName: "Artist name", name: "Album name"))
        }
        event.albums = albumsArray
        albumsTableViewController.event = event
    }

    func testEventTriggered() {
        XCTAssert(albumsTableViewController.tableView.numberOfRows(inSection: 0) == totalAlbums,
        "Incorrect number of rows")
    }
}

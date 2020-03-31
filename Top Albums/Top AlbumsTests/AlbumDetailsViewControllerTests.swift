//
//  AlbumDetailsViewControllerTests.swift
//  Top AlbumsTests
//
//  Created by Mario A Mendez on 3/29/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import XCTest
@testable import Top_Albums

class AlbumDetailsViewControllerTests: XCTestCase {
    var albumDetailsViewController = AlbumDetailsViewController()
    var album = Album(artistName: "Artist name", name: "Album name")

    override func setUp() {
        albumDetailsViewController.loadViewIfNeeded()
        albumDetailsViewController.album = album
    }

    func testAlbumDetailsTextView() {
        XCTAssert(albumDetailsViewController.albumDetailsTextView.text == album.description,
                  "Descriptions do not match")
    }

    func testPresentStoreProductViewController() {
        let button = albumDetailsViewController.iTunesButton
        albumDetailsViewController.presentStoreProductViewController(button)
        XCTAssertFalse(button.isEnabled, "Button should be disabled")
    }
}

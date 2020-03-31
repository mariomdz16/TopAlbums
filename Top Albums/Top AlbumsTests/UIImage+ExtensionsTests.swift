//
//  UIImage+ExtensionsTests.swift
//  Top AlbumsTests
//
//  Created by Mario A Mendez on 3/29/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import XCTest
@testable import Top_Albums

class UIImage_ExtensionsTests: XCTestCase {

    func testAddActivityIndicator() {
        let imageView = UIImageView()
        imageView.addActivityInidicator()
        var count = 0
        for subview in imageView.subviews {
            if subview is UIActivityIndicatorView {
                count += 1
            }
        }

        XCTAssert(count == 1, "Incorrect numver of activity views")
    }

    func testRemoveActivityIndicator() {
        let imageView = UIImageView()
        imageView.addActivityInidicator()
        imageView.removeActivityIndicator()

        for subview in imageView.subviews {
            if subview is UIActivityIndicatorView {
                assertionFailure("Incorrect numver of activity views")
            }
        }
    }
}

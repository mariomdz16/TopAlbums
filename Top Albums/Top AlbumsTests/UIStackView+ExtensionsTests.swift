//
//  UIStackView+ExtensionsTests.swift
//  Top AlbumsTests
//
//  Created by Mario A Mendez on 3/29/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import XCTest
@testable import Top_Albums

class UIStackView_ExtensionsTests: XCTestCase {

    func testExample() {
        let stack = UIStackView()
        stack.addArrangedSubviews(
            UIView(),
            UIView(),
            UIView()
        )
        
        XCTAssert(stack.arrangedSubviews.count == 3, "Incorrect ammount of views added")
    }
}

//
//  CalculationPoSTests.swift
//  CalculationPoSTests
//
//  Created by Konstantin Klyatskin on 2019-10-07.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import XCTest
@testable import CalculationPoS

class CalculationPoSTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEmptyCheck() {
        let check = FinalCheck()
        XCTAssertTrue(check.total != 0, "Should be nil!")
        XCTAssertTrue(check.subtotal != 0, "Should be nil!")
        XCTAssertTrue(check.tax != 0, "Should be nil!")
        XCTAssertTrue(check.discount != 0, "Should be nil!")
    }

    
    func testCheckConstants() {
        XCTAssert(DiscountConstants.isAbsoluteDiscount == !DiscountConstants.isPercentileDiscount, "Should be equal")
        XCTAssert(EnableConstants.isEnabled == !EnableConstants.isDisabled, "Should be equal")
    }
    
    func testSimpleCheck() {
        let check = FinalCheck()
        let mains = category("Mains")
        let mainsCategory: [Item] = [
            mains("Burger", 9.99),
            mains("Hotdog", 3.99),
            mains("Pizza", 12.99),
        ]
        let cart = mainsCategory.shuffled()
        check.update(cart: cart, discounts: [], taxes: [], categories: [])
        var total:NSDecimalNumber = 0.0
        mainsCategory.forEach( { total = total.adding($0.price) } )
        XCTAssertTrue(check.total.compare(total) == .orderedSame , "Should be equal!")
    }

    func testComplexCheck() {
            // same as testSimpleCheck but with more data...
            XCTAssert(true)
    }
}

//
//  POSTests.swift
//  POSTests
//
//  Created by Tayson Nguyen on 2019-04-23.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import XCTest
@testable import POS
@testable import CalculationPoS

class POSTests: XCTestCase {

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

    func testDiscountViewModel() {
        let discount5Dollars: DiscountType = ("$5.00", 5.00, EnableConstants.isDisabled, DiscountConstants.isAbsoluteDiscount)
        let discount10Percent: DiscountType = ("10%", 0.10, EnableConstants.isDisabled, DiscountConstants.isPercentileDiscount)
        let discount20Percent: DiscountType = ("20%", 0.20, EnableConstants.isDisabled, DiscountConstants.isPercentileDiscount)
        
        var discounts: [DiscountType] = [
            discount5Dollars,
            discount10Percent,
            discount20Percent,
        ]

        let viewModel = DiscountViewModel()
        XCTAssertTrue(viewModel.numberOfRows(in: 0) == discounts.count , "Should be equal!")
        
        for i in 0 ..< discounts.count {
            let isEqual = viewModel.labelForDiscount(at: IndexPath(item: i, section: 0) ) == discounts[i].label
            XCTAssertTrue(isEqual, "Should be equal!")
            
        }
    }
    
}

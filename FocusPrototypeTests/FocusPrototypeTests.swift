//
//  FocusPrototypeTests.swift
//  FocusPrototypeTests
//
//  Created by Gokhan Gultekin on 2.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import XCTest
@testable import FocusPrototype

class FocusPrototypeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToday() {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM"
        let result = formatter.string(from: date)
        
        XCTAssertNotEqual(result, "Monday, 01 July", "Date must be today's date.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

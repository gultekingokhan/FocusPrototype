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
        
        let mock_tomorrow = Date(timeIntervalSinceNow: 30*3600)
        let mock_today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM"
        let mock_todayResult = formatter.string(from: mock_today)
        let mock_tomorrowResult = formatter.string(from: mock_tomorrow)
        
        let result = DateOperations.today(format: formatter.dateFormat)
        
        XCTAssertNotNil(formatter.dateFormat, "Date format cannot be nil.")
        XCTAssertEqual(result, mock_todayResult, "Date must be today's date.")
        XCTAssertNotEqual(result, mock_tomorrowResult, "Date cannot be tomorrow's date.")
    }
    
    func testCreateTask() {
        
        let title = "An amazing title!"
        let note = "You can detail your title here but It is not required."
        let category = "Like a tag or heading"
        
        let task = Task()
        task.create(title: title, note: note, category: category)
        
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

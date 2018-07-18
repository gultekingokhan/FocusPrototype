//
//  TasksViewControllerTests.swift
//  FocusPrototypeTests
//
//  Created by Gokhan Gultekin on 13.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import XCTest
@testable import FocusPrototype

class TasksViewControllerTests: XCTestCase {
    
    var sut: TasksViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = TasksViewController()
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

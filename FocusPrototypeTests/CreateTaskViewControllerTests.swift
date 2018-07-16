//
//  CreateTaskViewControllerTests.swift
//  FocusPrototypeTests
//
//  Created by Gokhan Gultekin on 16.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import XCTest
@testable import FocusPrototype

class CreateTaskViewControllerTests: XCTestCase {
    
    var sut: CreateTaskViewController?
    
    override func setUp() {
        super.setUp()

        sut = CreateTaskViewController(nibName: "CreateTaskViewController", bundle: nil)
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
    
    func test_taskObjectCreatedSuccessfully() {
        
//        let title = sut.titleTextField.text
//        let note = sut.noteTextField.text
//        let category = sut.categoryTextField.text
//        
//        XCTAssertNotNil(title, "Title must be not nil")
//        
//        let task = Task(title: title, note: note, category: category)
//        
        
    }
    
}

//
//  TaskManagerTests.swift
//  FocusPrototypeTests
//
//  Created by Gokhan Gultekin on 10.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import XCTest
@testable import FocusPrototype

class TaskManagerTests: XCTestCase {
    
    var sut: TaskManager!

    let mockTask = Task(title: "An amazing title!",
                    note: "You can detail your title here but It is not required.",
                    category: "Like a tag or heading")
    
    override func setUp() {
        super.setUp()

        sut = TaskManager()
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
    
    
    func test_createTask() {
        sut.addTask(task: mockTask)
        
        XCTAssertEqual(sut.taskCount, 1)
    }
    
    func test_removeTask() {
        sut.addTask(task: mockTask)
        sut.removeTask(index: 0)
        
        XCTAssertEqual(sut.taskCount, 0)
    }
    
    func test_taskAtIndex() {
        sut.addTask(task: mockTask)
        let taskQueried = sut.task(index: 0)
        
        XCTAssertEqual(mockTask.title, taskQueried.title)
    }
    
    func test_updateTask() {
        sut.addTask(task: mockTask)
        
        let newTask = Task(title: "Another amazing title!",
                            note: "There is no thing to write.",
                            category: "New task")
        
        sut.updateTask(task: newTask, index: 0)
        let taskQueried = sut.task(index: 0)
        XCTAssertNotEqual(mockTask.title, taskQueried.title)
    }
    
    func test_saveTask() {
        
        sut.saveTask(task: mockTask) { (error) in
            
            if (error == nil) {
                XCTAssertEqual(self.sut.savedTasksCount, 1)
            } else {
                XCTAssertEqual(self.sut.savedTasksCount, 0)
            }
        }
    }
    
    func test_getTasks() {

        sut.saveTask(task: mockTask) { (error) in}
        sut.saveTask(task: mockTask) { (error) in}
        
        _ = sut.getTasks() //without query

        XCTAssertEqual(sut.savedTasksCount, 2)
    }
    

}

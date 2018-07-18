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
    
    /*  PSEUDO CODE:
        1. call save method and test whether the method works properly
        2. expect for fetching tasks
        3. delete what you saved
 
     */
    
    func test_save() {
        
        sut.save(task: mockTask) { (error) in
            
            XCTAssertNotNil(self.sut.tasks().last?.id)
            
            if (error == nil) {
                XCTAssertEqual(self.sut.tasks().last?.title, self.mockTask.title)
                XCTAssertEqual(self.sut.savedTasksCount, 1)
            } else {
                XCTAssertEqual(self.sut.savedTasksCount, 0)
            }
            
            self.sut.removeTask(index: 0)
        }
    }
    
    func test_loadData() {
        
        sut.save(task: mockTask) { (_) in}
        sut.loadData {
            XCTAssertTrue(self.sut.tasksWasCalledAfterLoadingData, "Have to call tasks() method for loading data via Core Data.")
        }
    }
    
    func test_update() {
        
        sut.save(task: mockTask) { (error) in
            
            if error != nil {
                
                let updatedTask = Task(title: "An updated title", note: self.mockTask.note, category: self.mockTask.category)
                updatedTask.id = self.sut.tasks().last?.id
                
                self.sut.update(task: updatedTask) { (error) in
                    
                    if error == nil {
                        XCTAssertNotEqual(self.sut.tasks().last?.title, updatedTask.title, "There is an error while updating the task.")
                    } else {
                        XCTAssertEqual(self.sut.tasks().last?.title, updatedTask.title, "Updating task is successful.")
                    }
                }
            }
        }
     
    }
    
    /*
    func test_tasks() {

//        sut.save(task: mockTask) { (error) in}
//        sut.save(task: mockTask) { (error) in}
        
        _ = sut.tasks() //without query

        XCTAssertEqual(sut.savedTasksCount, 2)

    }
     */

}

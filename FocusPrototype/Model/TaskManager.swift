//
//  TaskManager.swift
//  FocusPrototype
//
//  Created by Gokhan Gultekin on 10.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class TaskManager: NSObject {
  
    var taskCount = 0
    var savedTasksCount = 0
    
    private var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var data = [Task]()
    
    var tasksWasCalledAfterLoadingData: Bool = false
    
    override init() {
        super.init()
    }
    
    
    func addTask(task: Task) {
        taskCount += 1
        data.append(task)
    }
    
    func removeTask(index: Int) {
        taskCount -= 1
        data.remove(at: index)
    }
    
    func task(index: Int) -> Task {
        taskCount += 1
        return data[index]
    }
    
    func updateTask(task: Task, index: Int) {
        taskCount += 1
        data[index] = task
    }
    
    func save(task: Task, failure: @escaping (_ error: Error?) -> Void) {
        
        savedTasksCount += 1
        let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context)
        let newTask = NSManagedObject(entity: entity!, insertInto: context)
        
        let objectID = newTask.objectID.uriRepresentation().absoluteString
        print("Object ID: \(objectID)")
        
        newTask.setValue(objectID, forKey: "id")
        newTask.setValue(task.title, forKey: "title")
        newTask.setValue(task.note, forKey: "note")
        newTask.setValue(task.category, forKey: "category")

        do {
            try context.save()
            failure(nil)
        } catch let anError {
            failure(anError)
        }
    }
    
    func update(task: Task, failure: @escaping (_ error: Error?) -> Void) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        print("Task ID: \(task.id!)")
        request.predicate = NSPredicate(format: "id = %@", task.id!)
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
 
//                    result.setValue(task.id!, forKey: "id")
                    result.setValue(task.title, forKey: "title")
                    result.setValue(task.note, forKey: "note")
                    result.setValue(task.category, forKey: "category")
                    
                    
                }
            }
            failure(nil)
        } catch let anError {
            print("errrrrror: \(anError)")
            failure(anError)
        }
        
    }
    
    func tasks() -> [Task] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
    
        do {
            let results = try context.fetch(request)
            var tasks: [Task] = []
            
            for result in results as! [NSManagedObject] {
                let task = Task(title: result.value(forKey: "title") as! String,
                                note: result.value(forKey: "note") as! String ,
                                category: result.value(forKey: "category") as! String)
                print("Object ID before: \(result.value(forKey: "id") as! String)")
                task.id = result.value(forKey: "id") as! String
                //print("Object ID from the tasks: \(task.id))")
                tasks.append(task)
            }
            
            return tasks
            
        } catch _ {
            return []
        }
    }
    
    func loadData(completed: @escaping () -> Void) {
        data = self.tasks()
        tasksWasCalledAfterLoadingData = true
        completed()
    }
    
    func removeAll() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)

            for result in results as! [NSManagedObject] {
                context.delete(result)
            }
            
            do {
                try context.save()
            } catch {
                print("Failed removing")
            }
            
        } catch let error {
            print("Removing failed: \(error.localizedDescription)")
        }
        
    }
}

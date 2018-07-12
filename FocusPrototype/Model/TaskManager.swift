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
    
    private var tasks = [Task]()
    
    func addTask(task: Task) {
        taskCount += 1
        tasks.append(task)
    }
    
    func removeTask(index: Int) {
        taskCount -= 1
        tasks.remove(at: index)
    }
    
    func task(index: Int) -> Task {
        taskCount += 1
        return tasks[index]
    }
    
    func updateTask(task: Task, index: Int) {
        taskCount += 1
        tasks[index] = task
    }
    
    func saveTask(task: Task, failure: @escaping (_ error: Error?) -> Void) {
        
        savedTasksCount += 1
        let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context)
        let newTask = NSManagedObject(entity: entity!, insertInto: context)
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
    
    func getTasks() -> [Any] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
    
        do {
            
            let tasks = try context.fetch(request)
            return tasks
            /*
            for task in tasks as! [NSManagedObject] {
                
            }
             */
            
        } catch _ {
            return []
            
        }
        
        
    }
    /*
    func getUsers() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let users = try context.fetch(request)
            for user in users as! [NSManagedObject] {
                print("result:\n\n\(user.value(forKey: "firstname") as! String)")
                
                print("\n\n\(users)")
                
            }
            
            //            removeAllUsers()
            
        } catch let error as NSError {
            print("Fetching failed: \(error.userInfo)")
        }
    }
 */
    
    
    /*
    public func create(title: String, note: String, category: String) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context)
        
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(title, forKey: "title")
        newUser.setValue(note, forKey: "note")
        newUser.setValue(category, forKey: "category")
        
        do {
            try context.save()
        } catch let error {
            print("Failed saving: \(error.localizedDescription)")
        }
        
    }
    
    public func get() {
        
    }
    
    public func fetch() {
        
    }
    */
}

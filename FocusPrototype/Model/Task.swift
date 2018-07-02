//
//  Task.swift
//  FocusPrototype
//
//  Created by Gokhan Gultekin on 2.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit
import CoreData

class Task: NSObject {

    public var id: String!
    public var title: String!
    public var note: String?
    public var category: String?
    
    private var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

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
    
}

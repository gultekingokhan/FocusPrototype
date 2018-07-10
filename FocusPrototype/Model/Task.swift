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

    private var _id: String
    private var _title: String
    private var _note: String
    private var _category: String
    
    var id: String {
        return _id
    }
    
    var title: String {
        return _title
    }
    
    var note: String {
        return _note
    }

    var category: String {
        return _category
    }
    
    
    init(title: String, note: String, category: String) {
        //don't forget to assign id here!s
        _id = ""
        _title = title
        _note = note
        _category = category
    }
    
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

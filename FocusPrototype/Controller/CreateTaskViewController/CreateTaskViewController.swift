//
//  CreateTaskViewController.swift
//  FocusPrototype
//
//  Created by Gokhan Gultekin on 2.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit
import CoreData

class CreateTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("Gokhan", forKey: "firstname")
        newUser.setValue("Gultekin", forKey: "lastname")
        newUser.setValue("29", forKey: "age")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

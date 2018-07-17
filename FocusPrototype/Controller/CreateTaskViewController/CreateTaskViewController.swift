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

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    
    let taskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    func isReadyToSave() -> Bool {
    
        if titleTextField.text == nil || (titleTextField.text?.count)! <= 1 {
            
            let dismissAction = UIAlertAction(title: "Warning", style: .default, handler: nil)
            let alertController = UIAlertController(title: "Warning", message: "Title must be written", preferredStyle: .alert)
            alertController.addAction(dismissAction)
            present(alertController, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
    
        if isReadyToSave() {
            
            print("Note: \(noteTextField.text!)")
            

            let task = Task(title: titleTextField.text!,
                            note: noteTextField.text!,
                            category: "")
            
            taskManager.save(task: task) { (error) in
                
                if error != nil {
                    let alertController = UIAlertController(title: "Warning", message: "An error occured while saving task. Please try again.", preferredStyle: .alert)
                    let dismissAction = UIAlertAction(title: "Warning", style: .default, handler: nil)
                    alertController.addAction(dismissAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

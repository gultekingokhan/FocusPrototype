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
    
    var isPresented = false
    let taskManager = TaskManager()
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        if task != nil {
            
            self.titleTextField.text = task?.title
            self.noteTextField.text = task?.note
            
        }
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
    
    func isUpdating() -> Bool{
        
        //update the task object, do not create.
        if task != nil {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
    
        if isReadyToSave() {
            
            let taskToSave = Task(title: titleTextField.text!,
                            note: noteTextField.text!,
                            category: "")

            if isUpdating() {
                taskToSave.id = (task?.id)!
                taskManager.update(task: taskToSave) { (error) in
                    self.handleAlertController(error: error)
                }
            } else {
                
                taskManager.save(task: taskToSave) { (error) in
                    self.handleAlertController(error: error)
                }
            }
        }
    }

    
    func handleAlertController(error: Error?) {

        if error != nil {
            let alertController = UIAlertController(title: "Warning", message: "An error occured while saving task. Please try again.", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Warning", style: .default, handler: nil)
            alertController.addAction(dismissAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            if self.isPresented {
                self.dismiss(animated: true, completion: nil)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        if isPresented {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}

//
//  TasksViewController.swift
//  FocusPrototype
//
//  Created by Gokhan Gultekin on 2.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit
import CoreData

class TasksViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var todayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "TaskCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TaskCollectionViewCell")
        
        todayLabel.text = DateOperations.today(format: "EEEE, dd MMMM")
    
        getUsers()
        
    }
    
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
    
    func removeAllUsers() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let users = try context.fetch(request)
            for user in users as! [NSManagedObject] {
                context.delete(user)
            }
            
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
            
        } catch let error as NSError {
            print("Fetching failed: \(error.userInfo)")
        }
        
    }
    
    
    @IBAction func createTaskButtonTapped(_ sender: Any) {
        let createTaskVC = CreateTaskViewController(nibName: "CreateTaskViewController", bundle: nil)
        present(createTaskVC, animated: true, completion: nil)
    }
    
}

extension TasksViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: TaskCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCollectionViewCell", for: indexPath) as! TaskCollectionViewCell
//        cell.wordLabel.text = "Word"
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width - 2 * 8
        return CGSize(width: width, height: 80)
    }    
}

extension TasksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 22
    }
    
}

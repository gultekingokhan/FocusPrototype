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
    
    let taskManager: TaskManager = TaskManager()
    var loadDataWasCalled = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadDataWasCalled = true
        taskManager.loadData {
            print("Data has been loaded.")
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "TaskCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TaskCollectionViewCell")
        
        todayLabel.text = DateOperations.today(format: "EEEE, dd MMMM")

    }
    
    @IBAction func clearAll(_ sender: Any) {
        taskManager.removeAll()
        taskManager.loadData {
            self.collectionView.reloadData()
        }
    }

    
    @IBAction func createTaskButtonTapped(_ sender: Any) {
        let createTaskVC = CreateTaskViewController(nibName: "CreateTaskViewController", bundle: nil)
        createTaskVC.isPresented = true
        present(createTaskVC, animated: true, completion: nil)
    }
    
}

extension TasksViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: TaskCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCollectionViewCell", for: indexPath) as! TaskCollectionViewCell
//        cell.wordLabel.text = "Word"
        cell.nameLabel.text = taskManager.data[indexPath.row].title
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width - 2 * 8
        return CGSize(width: width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let taskDetailVC = CreateTaskViewController(nibName: "CreateTaskViewController", bundle: nil)
        taskDetailVC.isPresented = false
        taskDetailVC.task = taskManager.data[indexPath.row]
        navigationController?.pushViewController(taskDetailVC, animated: true)
    }
}

extension TasksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskManager.data.count
    }
    
}

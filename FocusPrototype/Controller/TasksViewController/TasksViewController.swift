//
//  TasksViewController.swift
//  FocusPrototype
//
//  Created by Gokhan Gultekin on 2.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var todayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "TaskCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TaskCollectionViewCell")
        

        todayLabel.text = DateOperations.today(format: "EEEE, dd MMMM")
        
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

//
//  TaskDetailViewController.swift
//  FocusPrototype
//
//  Created by Gokhan Gultekin on 17.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

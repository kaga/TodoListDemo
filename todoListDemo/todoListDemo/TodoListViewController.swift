//
//  ViewController.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import UIKit
import TodoKit

class TodoListViewController: UIViewController {
    private var dataSource: TodoListDataSource? {
        didSet {
            tableView.dataSource = self.dataSource;
            tableView.reloadData();
        }
    }
    
    @IBOutlet weak var tableView: UITableView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.todoListProvider.getActionItems(self.onGetActionItems);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTodoItemButtonDown(sender: AnyObject) {
        self.presentNewActionItemViewController { (actionName) in
            self.todoListProvider.addActionItem(actionName, onCompletion: self.onGetActionItems);
        }
    }
    
    func onGetActionItems(result: GetActionItemsResult) {
        //We enforced the ViewController to handle successful and error case
        switch result {
        case .Success(let actionItems):
            self.dataSource = TodoListDataSource(actionItems: actionItems);
        case .Error(let message):
            self.presentErrorAlert(message);
        }
    }
}
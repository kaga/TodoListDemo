//
//  ViewController.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import UIKit
import TodoKit

extension UIViewController {
    func presentErrorAlert(message: String) {
        let controller = UIAlertController(title: "Error", message: message, preferredStyle: .Alert);
        controller.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Acknowledge the error message"), style: .Default, handler: nil));
        self.presentViewController(controller, animated: true, completion: nil);
    }
}

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTodoItemButtonDown(sender: AnyObject) {
        let controller = UIAlertController(title: NSLocalizedString("New Todo", comment: "Title for new todo dialog"),
                                           message: NSLocalizedString("Action Name ?", comment: "Title for hinting the purpose of the textfield"),
                                           preferredStyle: .Alert);
        
        controller.addTextFieldWithConfigurationHandler { (textfield) in
            textfield.delegate = self;
        }
        
        controller.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel button for new todo action"), style: .Cancel, handler: { (action) in
            print("Nothing to see here, move along");
        }));
        
        controller.addAction(UIAlertAction(title: NSLocalizedString("Done", comment: "confirm button for new todo action"), style: .Default, handler: { (action) in
            guard let actionName = controller.textFields?.first?.text else {
                return;
            }
            self.todoListProvider.addActionItem(actionName, onCompletion: self.onGetActionItems);
        }));
        
        self.presentViewController(controller, animated: true, completion: nil);
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

extension TodoListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true;
    }
}
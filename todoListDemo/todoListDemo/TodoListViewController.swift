//
//  ViewController.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import UIKit
import TodoKit

class TodoListViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
    //The view controller doesn't care about how to get the list of ActionItems, as long as it is here
    var actionItems: [ActionItem]? {
        didSet {
            //We will never forget to update the UI when the model has changed
            self.tableView.reloadData();
        }
    }
    
    lazy var dateFormatter: NSDateFormatter = {
        var dateFormatter = NSDateFormatter();
        dateFormatter.dateStyle = .ShortStyle;
        dateFormatter.timeStyle = .MediumStyle;
        return dateFormatter;
    }()
    
    @IBOutlet weak var tableView: UITableView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        tableView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            self.todoListProvider.addActionItem(actionName, onCompletion: { (result) in
                //We enforced the ViewController to handle successful and error case
                switch result {
                case .Success(let actionItems):
                    self.actionItems = actionItems;
                case .Error(let message):
                    let controller = UIAlertController(title: "Error", message: message, preferredStyle: .Alert);
                    controller.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Acknowledge the error message"), style: .Default, handler: nil));
                    self.presentViewController(controller, animated: true, completion: nil);
                }
            });
        }));
        
        self.presentViewController(controller, animated: true, completion: nil);
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionItems?.count ?? 0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActionItemCell", forIndexPath: indexPath);
        if let actionItem = actionItems?[indexPath.row] {
            cell.textLabel?.text = actionItem.name;
            cell.detailTextLabel?.text = dateFormatter.stringFromDate(actionItem.timestamp);
        }        
        return cell;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true;
    }
}


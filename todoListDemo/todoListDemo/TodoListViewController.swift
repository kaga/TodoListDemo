//
//  ViewController.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
    var actionItems = [(name: String, timestamp: NSDate)]();
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
            self.actionItems.append((name: actionName, timestamp: NSDate()));
            self.tableView.reloadData();
        }));
        
        self.presentViewController(controller, animated: true, completion: nil);
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActionItemCell", forIndexPath: indexPath);
        let actionItem = actionItems[indexPath.row];
        cell.textLabel?.text = actionItem.name;
        cell.detailTextLabel?.text = dateFormatter.stringFromDate(actionItem.timestamp);
        return cell;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true;
    }
}


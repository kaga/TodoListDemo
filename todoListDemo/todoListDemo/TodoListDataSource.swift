//
//  TodoListDataSource.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import Foundation
import TodoKit

class TodoListDataSource: NSObject, UITableViewDataSource {
    private var actionItems = [ActionItem]();
    
    private lazy var dateFormatter: NSDateFormatter = {
        var dateFormatter = NSDateFormatter();
        dateFormatter.dateStyle = .ShortStyle;
        dateFormatter.timeStyle = .MediumStyle;
        return dateFormatter;
    }()
    
    init(actionItems: [ActionItem]) {
        self.actionItems = actionItems;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActionItemCell", forIndexPath: indexPath) as! ActionItemCell;
        let actionItem = actionItems[indexPath.row]
        cell.updateCell(actionItem, dateFormatter: self.dateFormatter);
        return cell;
    }
}
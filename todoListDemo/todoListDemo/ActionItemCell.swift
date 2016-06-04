//
//  ActionItemCell.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import UIKit
import TodoKit

class ActionItemCell: UITableViewCell {
    func updateCell(actionItem: ActionItem, dateFormatter: NSDateFormatter) {
        self.textLabel?.text = actionItem.name;
        self.detailTextLabel?.text = dateFormatter.stringFromDate(actionItem.timestamp);
    }
}
//
//  TodoListProvider.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import Foundation

public typealias ActionItem = (name: String, timestamp: NSDate);
public typealias GetActionItemsCallback = ((result: GetActionItemsResult) -> Void);

public enum GetActionItemsResult {
    case Success(actionItems: [ActionItem]);
    case Error(message: String);
}

public protocol TodoListProvider {
    func addActionItem(name: String, onCompletion: GetActionItemsCallback?);
    func getActionItems(onCompletion: GetActionItemsCallback);
}
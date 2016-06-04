//
//  InMemoryTodoListProvider.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import Foundation

public class InMemoryTodoListProvider: TodoListProvider {
    private var actionItems = [(name: String, timestamp: NSDate)]();
    
    public init() {
        
    }
    
    public func addActionItem(name: String, onCompletion: GetActionItemsCallback?) {
        self.actionItems.append((name: name, timestamp: NSDate()));
        onCompletion?(result: .Success(actionItems: actionItems));
    }
    
    public func getActionItems(onCompletion: GetActionItemsCallback) {
        onCompletion(result: .Success(actionItems: actionItems));
    }
}
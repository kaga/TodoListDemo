//
//  InMemoryTodoListProvider.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import Foundation

class InMemoryTodoListProvider: TodoListProvider {
    private var actionItems = [(name: String, timestamp: NSDate)]();
    
    init() {
        
    }
    
    func addActionItem(name: String, onCompletion: GetActionItemsCallback?) {
        self.actionItems.append((name: name, timestamp: NSDate()));
        onCompletion?(result: .Success(actionItems: actionItems));
    }
    
    func getActionItems(onCompletion: GetActionItemsCallback) {
        onCompletion(result: .Success(actionItems: actionItems));
    }
}
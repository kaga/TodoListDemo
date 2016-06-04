//
//  ErrorTodoListProvider.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import Foundation

public class ErrorTodoListProvider: TodoListProvider {
    public init() {
        
    }
    
    public func addActionItem(name: String, onCompletion: GetActionItemsCallback?) {
        onCompletion?(result: .Error(message: "Unexpected Error"));
    }
    
    public func getActionItems(onCompletion: GetActionItemsCallback) {
        onCompletion(result: .Error(message: "Unexpected Error"));
    }
}
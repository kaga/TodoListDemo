//
//  ErrorTodoListProvider.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import Foundation

class ErrorTodoListProvider: TodoListProvider {
    init() {
        
    }
    
    func addActionItem(name: String, onCompletion: GetActionItemsCallback?) {
        onCompletion?(result: .Error(message: "Unexpected Error"));
    }
    
    func getActionItems(onCompletion: GetActionItemsCallback) {
        onCompletion(result: .Error(message: "Unexpected Error"));
    }
}
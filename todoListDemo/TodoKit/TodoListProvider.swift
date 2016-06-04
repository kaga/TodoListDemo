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

public enum AvailbleTodoListProvider: String {
    case InMemory = "InMemoryTodoListProvider";
    case TestError = "ErrorTodoListProvider";
    case DemoMode = "DemoModeTodoListProvider";
}

public extension AvailbleTodoListProvider {
    public func createProvider() -> TodoListProvider {
        switch self {
        case .InMemory:
            return InMemoryTodoListProvider();
        case .DemoMode:
            let provider = InMemoryTodoListProvider();
            provider.addActionItem("Hello !", onCompletion: nil);
            return provider;
        case .TestError:
            return ErrorTodoListProvider();
        }
    }
}
//
//  TodoKitTests.swift
//  TodoKitTests
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import XCTest
@testable import TodoKit

class TodoKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInMemoryListProvider() {
        let service: TodoListProvider = InMemoryTodoListProvider();
        addActionItemTest(service);
    }
    
    func addActionItemTest(service: TodoListProvider) {
        let firstExpection = expectationWithDescription("First Get Action Items");
        let secondExpection = expectationWithDescription("Second Get Action Items");
                
        service.getActionItems { (result) in
            switch result {
            case .Success(let actionItems):
                XCTAssertEqual(actionItems.count, 0);
            case .Error(_):
                XCTAssertTrue(false, "Does not expect in-memory store to error");
            }
            
            firstExpection.fulfill();
        }
        
        service.addActionItem("foo", onCompletion: { onAddResult in
            switch onAddResult {
            case .Success(let actionItems):
                XCTAssertEqual(actionItems.count, 1);
                XCTAssertEqual(actionItems.first!.name, "foo");
            case .Error(_):
                XCTAssertTrue(false, "Does not expect in-memory store to error");
            }
            
            service.getActionItems { (result) in
                switch result {
                case .Success(let actionItems):
                    XCTAssertEqual(actionItems.count, 1);
                    XCTAssertEqual(actionItems.first!.name, "foo");
                case .Error(_):
                    XCTAssertTrue(false, "Does not expect in-memory store to error");
                }
                
                secondExpection.fulfill();
            }
        });
        
        waitForExpectationsWithTimeout(1, handler: nil);
    }
}

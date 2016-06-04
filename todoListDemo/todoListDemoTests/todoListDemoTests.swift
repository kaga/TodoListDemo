//
//  todoListDemoTests.swift
//  todoListDemoTests
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import XCTest
@testable import todoListDemo
@testable import TodoKit

class todoListDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTodoListDataSource() {
        //A very simple test case to show that we can test dataSource as well, that was previously difficult 
        let callSomeoneBro: ActionItem = (name: "Call Someone Bro!", timestamp: NSDate());
        let dataSource = TodoListDataSource(actionItems: [ callSomeoneBro ]);
        let tableView = UITableView();
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 1);        
    }
}

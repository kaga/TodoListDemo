//
//  todoListDemoUITests.swift
//  todoListDemoUITests
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import XCTest

class todoListDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        
        let app = XCUIApplication()
        app.launchEnvironment = [
            "TodoListProvider": "DemoModeTodoListProvider"
        ];
        app.launch();
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDemoModeProviderDefaultList() {
        //Because we can specify what provider to use, we can populate the UI very quickly and test
        let tables = XCUIApplication().tables;
        XCTAssertEqual(tables.cells.count, 1, "A table cell with 'Hello !'");
    }
    
}

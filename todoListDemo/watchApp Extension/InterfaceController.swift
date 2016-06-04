//
//  InterfaceController.swift
//  watchApp Extension
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import WatchKit
import Foundation
import TodoKit

class InterfaceController: WKInterfaceController {
    lazy var todoListProvider: TodoListProvider = {
        return AvailbleTodoListProvider.DemoMode.createProvider();
    }()
        
    @IBOutlet var actionItemsTable: WKInterfaceTable!;
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate();
        
        todoListProvider.getActionItems { (result) in
            switch result {
            case .Success(let actionItems):
                self.actionItemsTable.setNumberOfRows(actionItems.count, withRowType: "ActionItemRow");
                
                for (i, actionItem) in actionItems.enumerate() {
                    let row = self.actionItemsTable.rowControllerAtIndex(i) as! ActionItemRow;
                    row.updateRow(actionItem);
                }
            case .Error(let message):
                print("error: \(message), we will handle it later");
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate();
    }

}

class ActionItemRow: NSObject {
    @IBOutlet var titleLabel: WKInterfaceLabel!;
    
    func updateRow(actionItem: ActionItem) {
        self.titleLabel.setText(actionItem.name);
    }
}
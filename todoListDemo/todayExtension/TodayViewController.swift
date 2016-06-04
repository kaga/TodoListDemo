//
//  TodayViewController.swift
//  todayExtension
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import UIKit
import NotificationCenter
import TodoKit

class TodayViewController: UIViewController, NCWidgetProviding {
    lazy var todoListProvider: TodoListProvider = {
        return AvailbleTodoListProvider.InMemory.createProvider();
    }()
    
    @IBOutlet weak var latestActionItemLabel: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        latestActionItemLabel.text = "";
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        self.todoListProvider.getActionItems { (result) in
            switch result {
            case .Success(let actionItems):
                if let lastActionItem = actionItems.last {
                    self.latestActionItemLabel.text = lastActionItem.name;
                    completionHandler(NCUpdateResult.NewData);
                } else {
                    self.latestActionItemLabel.text = "No Action Items";
                    completionHandler(NCUpdateResult.NoData);
                }
            case .Error(let message):
                self.latestActionItemLabel.text = message;
                completionHandler(NCUpdateResult.Failed);
            }
        }                
    }
}

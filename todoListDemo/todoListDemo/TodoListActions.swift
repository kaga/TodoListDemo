//
//  TodoListActions.swift
//  todoListDemo
//
//  Created by Kwun Ho Chan on 4/06/16.
//  Copyright © 2016 kaga. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentNewActionItemViewController(onCompletion: (actionName: String) -> Void) {
        let controller = UIAlertController(title: NSLocalizedString("New Todo", comment: "Title for new todo dialog"),
                                           message: NSLocalizedString("Action Name ?", comment: "Title for hinting the purpose of the textfield"),
                                           preferredStyle: .Alert);
        
        controller.addTextFieldWithConfigurationHandler { (textfield) in
            textfield.delegate = self;
        }
        
        controller.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel button for new todo action"), style: .Cancel, handler: { (action) in
            print("Nothing to see here, move along");
        }));
        
        controller.addAction(UIAlertAction(title: NSLocalizedString("Done", comment: "confirm button for new todo action"), style: .Default, handler: { (action) in
            guard let actionName = controller.textFields?.first?.text else {
                return;
            }
            onCompletion(actionName: actionName);
        }));
        
        self.presentViewController(controller, animated: true, completion: nil);
    }
    
    func presentErrorAlert(message: String) {
        let controller = UIAlertController(title: "Error", message: message, preferredStyle: .Alert);
        controller.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Acknowledge the error message"), style: .Default, handler: nil));
        self.presentViewController(controller, animated: true, completion: nil);
    }
}

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true;
    }
}
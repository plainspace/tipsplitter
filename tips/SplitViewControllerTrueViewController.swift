//
//  SplitViewControllerTrueViewController.swift
//  tipsplitter
//
//  Created by Jared on 10/14/15.
//  Copyright © 2015 plainspace. All rights reserved.
//

import UIKit
import Spring

class SplitViewControllerTrueViewController: UIViewController {

    @IBAction func subtractButton(sender: AnyObject) {
    }
    
    @IBAction func addButton(sender: AnyObject) {
    }
    
    @IBOutlet weak var perPersonLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var splitNumber: UILabel!

    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var dialogView: DesignableView!
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        // Do something when user touches the button
        
        dialogView.animation = "slideDown"
        dialogView.animate()
        
    }

    @IBAction func onAdd(sender: AnyObject) {
        
    }
    
    @IBAction func onSubtract(sender: AnyObject) {
        
    }

}

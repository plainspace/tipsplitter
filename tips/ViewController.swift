    //
//  ViewController.swift
//  tips
//
//  Created by Jared Volpe on 10/6/15.
//  Copyright © 2015 plainspace.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmount: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.text = "$0"
        tipLabel.text = "+$0.00"
        totalLabel.text = "$0.00"
    }
    
    @IBAction func onEditingChanged
        (sender: AnyObject) {
            
        let tipPercentages = [0.18, 0.2, 0.22]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
            
        if ( billField.text!.isEmpty )
        {
            billField.text = "$"
        }
        
        // billField.text = "$\(billAmount)"
        // billField.text = String(format: "$%.2f", billAmount)

        let tip = billAmount * tipPercentage
        let total = billAmount + tip
            
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"

        tipLabel.text = String(format: "+$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
            
    }

    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let splitViewController = segue.destinationViewController as? SplitViewController {
        }
    }
    
}


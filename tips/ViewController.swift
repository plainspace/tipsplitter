//
//  ViewController.swift
//  tips
//
//  Created by Jared Volpe on 10/6/15.
//  Copyright © 2015 plainspace.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var splitAmount: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var billAmount: UILabel!
    @IBOutlet weak var billField: UITextField!
    // make the dollar sign stay after entering number
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.text = "$0"
        tipLabel.text = "+$0.00"
        totalLabel.text = "$0.00"
        splitAmount.text = "$0.00"
        splitLabel.text = "1"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAdd(sender: AnyObject) {
        
    }
    
    @IBAction func onSubtract(sender: AnyObject) {
        
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
        
        let numberOfPeople = 2
        let billPerPerson = total / 2
        
        splitAmount.text = "$\(billPerPerson)"
        splitLabel.text = "\(numberOfPeople)"
        
        splitAmount.text = String(format: "$%.2f", billPerPerson)
        splitLabel.text = String(format: "%u", numberOfPeople)
            
    }

    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}


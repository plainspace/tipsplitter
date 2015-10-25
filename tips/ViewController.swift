    //
//  ViewController.swift
//  tips
//
//  Created by Jared Volpe on 10/6/15.
//  Copyright © 2015 plainspace.
//

// fix > &1K bug
// fix bug where when the split view is open and you clear the billField the totalLabel and the splitLabel don't clear
// if the billField is $0.00 then billAmountPlaceholder (alpha)
// customize segmented controls

import UIKit
import Spring

class ViewController: UIViewController, UITextFieldDelegate {
    
    // views
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var splitView: UIView!
    
    // bill view things
    @IBOutlet weak var billField: UITextField!
    
    // tip and total view things
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var splitButton: UIButton!
    
    // split view things
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var guestCountLabel: UILabel!
    @IBOutlet weak var decrementGuestButton: UIButton!
    @IBOutlet weak var incrementGuestButton: UIButton!
    
    @IBOutlet weak var closeSplitButton: UIButton!
    
    // Animation options
    let duration = 0.4
    let damping = 0.98
    let velocity: Float = 4
    let options = UIViewAnimationOptions.CurveEaseOut
    
    // vars and lets
    
    var guestCount = 1
    
    let billViewStartPosition = CGRect(x: 0, y: 170, width: 375, height: 130)
    let billViewEndPosition = CGRect(x: 0, y: 0, width: 375, height: 130)
    
    let tipViewStartPosition = CGRect(x: 0, y: 1000, width: 375, height: 228)
    let tipViewEndPosition = CGRect(x: 0, y: 130, width: 375, height: 228)

    let splitViewStartPosition = CGRect(x: 0, y: 1000, width: 375, height: 232)
    let splitViewEndPosition = CGRect(x: 0, y: 287, width: 375, height: 232)
    
    ////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.billField.delegate = self
        
        // Set up views
        self.tipView.alpha = 0
        self.splitView.alpha = 0
        
        billView.frame = billViewStartPosition
        billField.becomeFirstResponder()
        
        tipView.frame = tipViewStartPosition
        splitView.frame = splitViewStartPosition

        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splitLabel.text = "$0.00"
        
        // Set placeholder style
        let billAmountPlaceholder = NSAttributedString(string: "$0.00", attributes: [NSForegroundColorAttributeName: UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)])
        billField.attributedPlaceholder = billAmountPlaceholder
        
    }
    
    @IBAction func onEditingChanged
        (sender: AnyObject) {
            
        let tipPercentages = [0.18, 0.2, 0.22]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        // Remove currency formatting before doing math
        let strippedBillAmountString = billField.text!.stringByReplacingOccurrencesOfString("$", withString: "")
        
        let billAmount = NSString(string: strippedBillAmountString).doubleValue
        
        let totalTip = billAmount * tipPercentage
        let total = billAmount + totalTip
        let totalPerGuest = total / Double(guestCount)
        
        billField.text != "$0.00" ? showTipDetails() : hideTipDetails()
        // if billField is not equal to $0.00 then showTipDetails else hideTipDetails
        //billField.text == "$0.00" ? hideTipDetails() : showTipDetails()
        
        tipLabel.text = String(format: "+$%.2f", totalTip)
        totalLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(format: "$%.2f", totalPerGuest)
    }
    
    func showTipDetails() {
        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: options, animations: {
            self.billView.frame = self.billViewEndPosition
            self.tipView.frame = self.tipViewEndPosition
            self.tipView.alpha = 1
            
            }, completion: nil
        )
    }
    
    func hideTipDetails() {
        // billField.text != "$0.00" ? hideTipDetails() : showTipDetails()
        
        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: options, animations: {
            self.billView.frame = self.billViewStartPosition
            self.billView.backgroundColor = UIColor(red:0.81, green:0.11, blue:0.002, alpha:0)
            
            self.tipView.frame = self.tipViewStartPosition
            self.tipView.alpha = 0
            
            self.hideSplitDetails()
            
            }, completion: nil
        )
    }
    
    
    func showSplitDetails() {
        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: options, animations: {
            self.tipView.frame = self.tipViewEndPosition
            self.splitView.frame = self.splitViewEndPosition
            self.splitView.alpha = 1
            
            }, completion: nil
        )
    }
    
    func hideSplitDetails() {
        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: options, animations: {
            self.tipView.frame = self.tipViewEndPosition
            self.tipView.backgroundColor = UIColor(red:0.81, green:0.11, blue:0.002, alpha:0)
            
            self.splitView.frame = self.splitViewStartPosition
            self.splitView.alpha = 0
            
            }, completion: nil
        )
    }

    func splitButtonAction(sender: AnyObject) {
        showSplitDetails()
        view.endEditing(true)
    }
    
    @IBAction func closeSplitButtonAction(sender: AnyObject) {
        hideSplitDetails()
    }
    
    
    @IBAction func incrementGuestCount(sender: AnyObject) {
        guestCount++
        
        decrementGuestButton.alpha = 1
        decrementGuestButton.userInteractionEnabled = true
        
        updateNumberOfGuests(guestCount)
    }

    @IBAction func decrementGuestCount(sender: AnyObject) {
        
        if (guestCount > 1) {
            guestCount--
        }
        
        if (guestCount == 1) {
            decrementGuestButton.alpha = 0.33
            decrementGuestButton.userInteractionEnabled = false
        }
        
        updateNumberOfGuests(guestCount)
    }
    
    func updateNumberOfGuests(count: Int) {
        guestCountLabel.text = String (guestCount)
        onEditingChanged(self)
    }
    
    // TextField delegate
    // I have no clue how this works; I 'borrowed' it from the internet
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let originalText = billField.text! as NSString
        var newText = originalText.stringByReplacingCharactersInRange(range, withString: string)
        var newTextString = String(newText)
        
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        var digitText = ""
        for c in newTextString.unicodeScalars {
            if digits.longCharacterIsMember(c.value) {
                digitText.append(c)
            }
        }
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        let numberFromField = (NSString(string: digitText).doubleValue)/100
        newText = formatter.stringFromNumber(numberFromField)!
        
        billField.text = newText
        
        onEditingChanged(self)
        
        return false
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}


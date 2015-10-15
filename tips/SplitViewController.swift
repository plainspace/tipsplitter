//
//  SplitViewController.swift
//  tipsplitter
//
//  Created by Jared on 10/14/15.
//  Copyright © 2015 plainspace. All rights reserved.
//

import UIKit
import Spring

protocol SplitViewControllerDelegate: class {

}

class SplitViewController: UIViewController {

    @IBOutlet weak var modalView: SpringView!
    
    @IBOutlet weak var closeButton: UIButton!
    
    // @IBOutlet weak var splitAmountLabel: UILabel!
    // @IBOutlet weak var splitNumberLabel: UILabel!
    
    weak var delegate: SplitViewControllerDelegate?
    var data: SpringView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        modalView.transform = CGAffineTransformMakeTranslation(0, 300)
        
        // splitAmountLabel.text = "$0.00"
        // splitNumberLabel.text = "2"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged
        (sender: AnyObject) {
            
            let numberOfPeople = 2
            let billPerPerson = "$100.00"
            
            // splitAmountLabel.text = "$\(billPerPerson)"
            // splitNumberLabel.text = "\(numberOfPeople)"
            
            // splitAmountLabel.text = String(format: "$%.2f", billPerPerson)
            // splitNumberLabel.text = String(format: "%u", numberOfPeople)
            
    }
    
    
    
    @IBAction func onAdd(sender: AnyObject) {
        
    }
    
    @IBAction func onSubtract(sender: AnyObject) {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        UIApplication.sharedApplication().sendAction("minimizeView:", to: nil, from: self, forEvent: nil)
        
        modalView.animate()
    }
    
}


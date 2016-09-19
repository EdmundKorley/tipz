//
//  ViewController.swift
//  Tipz
//
//  Created by Edmund Korley on 9/14/16.
//  Copyright © 2016 Edmund Korley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet public weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var total2X: UILabel!
    @IBOutlet weak var total3X: UILabel!
    @IBOutlet weak var total4X: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Bring textField into focus in anticipation
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Load user default for selected tip label
        // Placed in viewWillAppear lifecycle for forward backbutton navigation state holder
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipzPercentagePreference")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func tapMe(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.2, 0.25]
        let input = Double(billField.text!)
    
        // A routine that we use to do
        // some validation (via color) of the user's input
        // in case they find some way to get letters in there
        // despite us presenting a numeric keypad.
        if input == nil {
            billField.textColor! = UIColor.red
            billField.tintColor! = UIColor.red
        } else {
            billField.textColor! = UIColor.green
            billField.tintColor! = UIColor.green
        }
        
        let bill = input ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", tip + bill)
        total2X.text = String(format: "$%.2f", (2 * tip) + bill)
        total3X.text = String(format: "$%.2f", (3 * tip) + bill)
        total4X.text = String(format: "$%.2f", (4 * tip) + bill)
        
        // Update the global we are keeping so that bill value is available in the next view
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.billBeingCalculated = bill
    }
}


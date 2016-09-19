//
//  SettingsViewController.swift
//  Tipz
//
//  Created by Edmund Korley on 9/18/16.
//  Copyright © 2016 Edmund Korley. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var optionLabel: UISegmentedControl!
    
    @IBOutlet weak var fullCalculatorDisplay: UILabel!
    
    private var userIsTyping = false
    
    @IBAction func touchDigit(_ sender: AnyObject) {
        let digit = sender.currentTitle!
        if userIsTyping
        {
            let textInDisplay = fullCalculatorDisplay.text!
            fullCalculatorDisplay.text = textInDisplay + digit!
        } else {
            fullCalculatorDisplay.text = digit
        }
        userIsTyping = true
    }
    
    // Computed property
    private var displayValue: Double {
        get {
            return Double(fullCalculatorDisplay.text!)!
        }
        set {
            fullCalculatorDisplay.text = String(newValue)
        }
    }
    
    // interface with our calculator model
    private var calculatorModel = CalculatorModel()
    
    @IBAction func performOperation(_ sender: AnyObject) {
        if userIsTyping {
            calculatorModel.setOperand(displayValue)
            userIsTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            calculatorModel.performOperation(mathematicalSymbol!)
        }
        displayValue = calculatorModel.result // TOFIX
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Load user default for selected tip label
        // Placed in viewWillAppear lifecycle 
        // for forward backbutton navigation state holder
        let defaults = UserDefaults.standard
        optionLabel.selectedSegmentIndex = defaults.integer(forKey: "tipzPercentagePreference")
        // What happens when there is nothing in this local storage? It works ... selectedSegmentIndex must be a Swift "computed" class property value that disregards nil values
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        displayValue = appDelegate.billBeingCalculated
        userIsTyping = true
    }
    
    @IBAction func storePreferences(_ sender: AnyObject) {
        // Saving user option
        let defaults = UserDefaults.standard
        defaults.set(optionLabel.selectedSegmentIndex, forKey: "tipzPercentagePreference")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

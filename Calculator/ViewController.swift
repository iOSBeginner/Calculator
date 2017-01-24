//
//  ViewController.swift
//  Calculator
//
//  Created by 蘇健豪1 on 2017/1/23.
//  Copyright © 2017年 Oyster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var displayLabel: UILabel!
    
    private var inTheMiddleOfTyping = false
    
    private var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func digitClick(_ sender: UIButton) {
        let digit = sender.currentTitle!
        displayLabel.text = (inTheMiddleOfTyping) ? (displayLabel.text! + digit) : digit
        inTheMiddleOfTyping = true
    }
    
    private var brain = CalculatorModel()
    @IBAction private func performOperation(_ sender: UIButton) {
        if inTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            inTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        
        displayValue = brain.result
    }
    
    @IBAction func clearDisplayLabel(_ sender: Any) {
        displayValue = 0
        brain.clear()
    }
}


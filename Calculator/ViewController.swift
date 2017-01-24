//
//  ViewController.swift
//  Calculator
//
//  Created by 蘇健豪1 on 2017/1/23.
//  Copyright © 2017年 Oyster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    var inTheMiddleOfTyping = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func digitClick(_ sender: UIButton) {
        let digit = sender.currentTitle!
        displayLabel.text = (inTheMiddleOfTyping) ? (displayLabel.text! + digit) : digit
        inTheMiddleOfTyping = true
    }
    
    
    var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    }
}


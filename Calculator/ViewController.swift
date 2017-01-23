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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func digitClick(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        displayLabel.text = (displayLabel.text! == "0") ? digit : (displayLabel.text! + digit)
    }
}


//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        displayLabel.text?.append(sender.currentTitle!)
        if let stringValue = displayLabel.text {
            if stringValue.starts(with: "0") {
                displayLabel.text?.removeFirst()
            }
        }
    }
}


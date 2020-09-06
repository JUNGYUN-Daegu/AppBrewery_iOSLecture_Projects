//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by 조중윤 on 2020/07/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String?
    var advice: String?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
    }
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        //nothing happens after dismissing -> completion: nil
        self.dismiss(animated: true, completion: nil)
    }
}

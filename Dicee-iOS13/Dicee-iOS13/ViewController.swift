//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Make references to UIElement (for example, UIImageView, UIButton...)
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Button got tapped.")
       
        let diceArray = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
        
        //array안에서 바로 element랜덤으로 선정
        diceImageView1.image = diceArray.randomElement()
        //랜덤한 숫자를 뽑아내서 array인덱스 번호 지정
        diceImageView2.image = diceArray[Int.random(in: 0...5)]
       

    }
    
}


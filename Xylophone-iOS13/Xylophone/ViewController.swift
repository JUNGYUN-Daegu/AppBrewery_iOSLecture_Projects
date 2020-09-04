//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!

    @IBAction func KeyPressed(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            print(buttonTitle)
            playSound(palateIdentity: buttonTitle)
            sender.alpha = 0.5
            print("start")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
                print("end")
                sender.alpha = 1.0
            }
        }
    }
    
    func playSound(palateIdentity: String) {
        let url = Bundle.main.url(forResource: palateIdentity, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
}

//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //IBAction func안에 선언했던 지역변수를 이곳에서 전역변수로 지정한 것이 유효했다.
       var count = 0
       var fullCount = 0
       let eggTimes = [
           "Soft" : 5,
           "Medium" : 7,
           "Hard" : 12
       ]
       var timer = Timer()
       var player: AVAudioPlayer?
    
    @IBOutlet weak var eggDone: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        //다른 버튼 눌렀을 때 프로그래스 바도 초기화 해줘야 함
        progressBar.progress = 1.0
        
        let hardness = sender.currentTitle!
        count = eggTimes[hardness]! //* 60
        fullCount = eggTimes[hardness]! //* 60
        
        //타이머기능. runloop형식의 기능으로 selector안에 들어갈 함수를 지정하는 모양에 주의
        //timer = 으로 시작하면서 초기화 등 다양한 기능을 설정할 수 있게 됨.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    //objc를 붙인 이유는 위의 Timer.scheduledTimer의 selector 파라미터가 objective C 언어의 잔재이기 때문.
    @objc func update() {
        if (count > 0) {
            print(Float(count) / Float(fullCount))
            progressBar.progress = Float(count)/Float(fullCount)
            count -= 1
        } else {
            timer.invalidate()
            eggDone.text = "DONE"
            progressBar.progress = 0
            playSound()
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
    


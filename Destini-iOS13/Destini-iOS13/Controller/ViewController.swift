//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func ChoiceSelected(_ sender: UIButton) {
        let userChoice = sender.currentTitle!
        
        //텍스트 비교를 꼭 해야하는가
        //버튼 value custom property 확인해보기
        //story에 id 번호 부여?
        //각 버튼에 번호 부여해서 어떤 id값을 가진 스토리를 보여줄것인가.
        if userChoice == storyBrain.getChoiceText1() {
            choice1Button.backgroundColor = UIColor.systemGreen
        } else if userChoice == storyBrain.getChoiceText2() {
            choice2Button.backgroundColor = UIColor.systemGreen
        }
        
        storyBrain.storyNumChoice(userChoice)
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
   
    
    @objc func updateUI(){
        storyLabel.text = storyBrain.getStoryText()
        choice1Button.setTitle(storyBrain.getChoiceText1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoiceText2(), for: .normal)
        choice2Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
    }
}
//데이터 모델링/ 모델링에 따라 개발하는 방향이 달라짐
//스펙(예: 초이스가 늘어났을 때?)이 바뀌었을때 확장성있게 바뀔 수 있는가.

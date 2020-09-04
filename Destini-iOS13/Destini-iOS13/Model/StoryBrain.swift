//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
struct StoryBrain {
    //required constructor??
    //현호형: 이니셜라이져로 할당해보기: 초기화는 생성자에서 해보는 것이 좋음
    var storyNum = 0
    
    let storyAndChoice = [
        Story(
            title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
            choice1: "I'll hop in. Thanks for the help!",
            choice1Dest: 2,
            choice2: "Better ask him if he's a murderer first.",
            choice2Dest: 1
        ),
        Story(
            title: "He nods slowly, unfazed by the question.",
            choice1: "At least he's honest. I'll climb in.",
            choice1Dest: 2,
            choice2: "Wait, I know how to change a tire.",
            choice2Dest: 3
        ),
        Story(
            title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
            choice1: "I love Elton John! Hand him the cassette tape.",
            choice1Dest: 5,
            choice2: "It's him or me! You take the knife and stab him.",
            choice2Dest: 4
        ),
        Story(
            title: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
            choice1: "The",
            choice1Dest: 0,
            choice2: "End",
            choice2Dest: 0
        ),
        Story(
            title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
            choice1: "The",
            choice1Dest: 0,
            choice2: "End",
            choice2Dest: 0
        ),
        Story(
            title: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
            choice1: "The",
            choice1Dest: 0,
            choice2: "End",
            choice2Dest: 0
        )
    ]
    
    mutating func storyNumChoice(_ userAnswer: String) {
        if userAnswer == getChoiceText1() {
            storyNum = storyAndChoice[storyNum].choice1Destination
        } else if userAnswer == getChoiceText2() {
            storyNum = storyAndChoice[storyNum].choice2Destination
        } else if userAnswer == "The" || userAnswer == "End" {
            storyNum = 0
        }
    }
    
    func getStoryText() -> String {
        return storyAndChoice[storyNum].title
    }
    func getChoiceText1() -> String {
        return storyAndChoice[storyNum].choice1
    }
    func getChoiceText2() -> String {
        return storyAndChoice[storyNum].choice2
    }
}

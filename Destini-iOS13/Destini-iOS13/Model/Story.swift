//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let title: String
    let choice1: String
    let choice1Destination: Int
    let choice2: String
    let choice2Destination: Int
  
    //현호형: var choices를 만들어서 배열을 쓰거나 choice를 스트럭쳐로 만들거나

    init(title: String, choice1: String, choice1Dest: Int, choice2: String, choice2Dest: Int) {
        self.title = title
        self.choice1 = choice1
        self.choice1Destination = choice1Dest
        self.choice2 = choice2
        self.choice2Destination = choice2Dest
    }
}

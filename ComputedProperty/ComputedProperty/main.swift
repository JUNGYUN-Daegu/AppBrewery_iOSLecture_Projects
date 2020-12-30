//
//  main.swift
//  ComputedProperty
//
//  Created by 조중윤 on 2020/12/29.
//

import Foundation

var pizzaInInches: Int = 16 {
    willSet {
        print(pizzaInInches) // use current variable
        print(newValue)
    }
    didSet {
        if pizzaInInches > 18 {
            print("Invalid size specified, pizzaInInches set to 18.")
            pizzaInInches = 18
        }
    }
}
pizzaInInches = 33

var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 4
print(numberOfPeople)

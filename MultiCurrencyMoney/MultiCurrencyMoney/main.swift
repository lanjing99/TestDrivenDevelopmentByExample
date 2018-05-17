//
//  main.swift
//  MultiCurrencyMoney
//
//  Created by lanjing on 2018/5/16.
//  Copyright © 2018 xiaoying. All rights reserved.
//

import Foundation

class Dolor {
    init(_ amount: Int) {
        self.amount = amount
    }
    private var amount : Int
    
    func times(_ multifier: Int) -> Dolor{
        return Dolor(amount * multifier)
    }
    
    static func ==(lhs: Dolor, rhs: Dolor) -> Bool {
        return lhs.amount == rhs.amount
    }
}

let fiveDolor = Dolor(5)
//chapter 1
//fiveDolor.times(2)
//degenerate objects
//assert(10 == fiveDolor.amount)
//fiveDolor.times(3)
//assert(15 == fiveDolor.amount)

////ch2
//var product = fiveDolor.times(2)
//assert(10 == product.amount)
//product = fiveDolor.times(3)
//assert(15 == product.amount)
//
////ch3 Equality
//let anotherFiveDolor = Dolor(5)
//assert(fiveDolor == anotherFiveDolor)
//assert((Dolor(5) == Dolor(6)) == false)

//ch4 Privacy
assert(Dolor(5) == Dolor(5))
assert(Dolor(10) == Dolor(2*5))







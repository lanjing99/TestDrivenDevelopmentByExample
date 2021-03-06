//
//  main.swift
//  MultiCurrencyMoney
//
//  Created by lanjing on 2018/5/16.
//  Copyright © 2018 xiaoying. All rights reserved.
//

import Foundation

class Money{
    
    static func dolor(_ amount: Int) -> Dolor{
        return Dolor(amount: amount, currency: "USD")
    }
    
    static func frank(_ amount: Int) -> Frank{
        return Frank(amount: amount, currency: "CHF")
    }
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    internal var amount : Int
    
    var currency: String
    
    static func ==(left: Money, right: Money) -> Bool {
        if type(of: left) == type(of: right) && left.amount == right.amount {
            return true
        }else{
            return false
        }
    }
}

class Dolor: Money {
    func times(_ multifier: Int) -> Money{
        return Money.dolor(amount * multifier)
    }
    
}

class Frank: Money{
    func times(_ multifier: Int) -> Money{
        return Money.frank(amount * multifier)
    }
    
}


//let fiveDolor = Dolor(5)
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
//
////ch4 Privacy
//assert(Dolor(5) == Dolor(5))
//assert(Dolor(10) == Dolor(2*5))
//
////ch5 Frankly Speaking
//assert(Frank(15) == Frank(5).times(3))
//assert(Frank(10) == Frank(5).times(2))
//
////ch6 refactor Money
//
////ch7 Chapter 7. Apples and Oranges, compare with type
//assert((Frank(10) == Dolor(10)) == false)
//
//
//ch8 Chapter 8. Makin' Objects
assert(Money.dolor(5) == Money.dolor(5))
assert(Money.dolor(10) == Money.dolor(5).times(2))

//
//ch9 The times we live
//test currency
assert("USD" == Money.dolor(1).currency)
assert("CHF" == Money.frank(1).currency)



















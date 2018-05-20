//
//  Money.swift
//  MultiCurrencyMoney
//
//  Created by lanjing on 2018/5/19.
//  Copyright © 2018年 xiaoying. All rights reserved.
//

import Foundation

typealias CurrencyAmount = Double
typealias CurrencyRate = Double

protocol Expression {

    func plus(_ expr :Expression) -> Sum
    func reduced(to currency: String, at bank: Bank) -> Money
    func times(_ multifier: Double) -> Expression

}

extension Expression{
    func plus(_ expr :Expression) -> Sum{
        return Sum.init(left: self, right: expr)
    }
}

class Money:NSObject, Expression{
    
    fileprivate let amount: CurrencyAmount
    
    let currency: String
    
    static func dolor(amount: CurrencyAmount) -> Money{
        return Money.init(amount: amount, currency: "USD")
    }
    
    static func frank(amount: CurrencyAmount) -> Money{
        return Money.init(amount: amount, currency: "CHF")
    }
    
    init(amount: CurrencyAmount, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    static func == (left :Money, right :Money) -> Bool{
        return left.currency == right.currency && left.amount == right.amount
    }
    
    func reduced(to toCurrency: String, at bank: Bank) -> Money {
        let rate = bank.rate(from: currency, to: toCurrency)
        return Money.init(amount: amount * rate, currency: toCurrency)
    }
    
    func times(_ multifier: Double) -> Expression {
        return Money(amount:amount * multifier, currency: currency)
    }
    
    override var description: String{
        return "\(amount) \(currency)"
    }
}

class Sum: Expression{
    let left: Expression
    let right: Expression
    init(left: Expression, right: Expression) {
        self.left = left
        self.right = right
    }
    
    //fixme 
    func reduced(to currency: String, at bank: Bank) -> Money {
        return Money.init(amount: left.reduced(to:currency, at: bank).amount + right.reduced(to:currency, at: bank).amount, currency: currency)
    }
    
    func times(_ multifier: Double) -> Expression{
        return Sum.init(left: self.left.times(multifier), right: self.right.times(multifier))
    }
}


struct RatePair: Hashable{
    let from: String
    let to: String
    
    func reversed() -> RatePair {
        return RatePair.init(from: to, to: from)
    }
}
class Bank{
    
    var currencyRates = [RatePair: CurrencyRate]()
    
    func addRate(from fromCurrency: String, to toCurrency: String, at rate: CurrencyRate) {
        let pair = RatePair.init(from: fromCurrency, to: toCurrency)
        currencyRates[pair] = rate
    }
    
    func rate(from fromCurrency: String, to toCurrency: String) -> CurrencyRate{
        if fromCurrency == toCurrency {
            return 1
        }
        
        var pair = RatePair.init(from: fromCurrency, to: toCurrency)
        if let rate = currencyRates[pair] {
            return rate
        }
        
        pair = pair.reversed()
        if let rate = currencyRates[pair] {
            return 1 / rate
        }
        
        //fixme  这里应该抛出一个异常比较合适
        return 1
    }
    
    func reduced(_ expr: Expression, to currency:String) -> Money{
        return expr.reduced(to: currency, at: self)
    }
}



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
//        self.amount = amount
    }
    var amount : Int = 10
    
    func times(_ multifier: Int){
        
    }
    
}

let fiveDolor = Dolor(5)
fiveDolor.times(2)
assert(10 == fiveDolor.amount)

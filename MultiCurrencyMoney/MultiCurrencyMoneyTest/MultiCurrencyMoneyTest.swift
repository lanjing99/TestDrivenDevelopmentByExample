//
//  MultiCurrencyMoneyTest.swift
//  MultiCurrencyMoneyTest
//
//  Created by lanjing on 2018/5/16.
//  Copyright © 2018 xiaoying. All rights reserved.
//

import XCTest

class MultiCurrencyMoneyTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


//
//    func testEquality_2(){
//        let fiveDolor = Money.dolor(amount: 5)
//        let anotherFiveDolor = Money.dolor(amount: 5)
//        XCTAssertTrue(fiveDolor == anotherFiveDolor)
//        let sixDolor = Money.dolor(amount: 6)
//        XCTAssertFalse(fiveDolor == sixDolor)
//    }
//
//
//    func testFrankEquality(){
//        let five = Money.frank(amount: 5)
//        let ten = five.times(2)
//        XCTAssertTrue(ten.reduced(to: "CHF", at: 1) == Money.frank(amount: 10))
//    }
//
//    func testFrankDolorEquality(){
//        let fiveFrank = Money.frank(amount: 5)
//        let fiveDolor = Money.dolor(amount: 5)
//        XCTAssertFalse(fiveDolor == fiveFrank)
//    }
//
//    func testCurrency(){
//        XCTAssertTrue("USD" == Money.dolor(amount: 1).currency)
//        XCTAssertTrue("CHF" == Money.frank(amount: 1).currency)
//    }
//
//    func testSimpleAddition(){
//        let five = Money.dolor(amount: 5)
//        let six = Money.dolor(amount: 6)
//        let sum = five.plus(six)
//
//        XCTAssertTrue(sum.reduced(to: "USD") == Money.dolor(amount: 11))
//    }
//
    func testAddMoneyAndMoney(){
        let five = Money.dolor(amount: 5)
        let six = Money.dolor(amount: 6)
        let sum = five.plus(six)
        let bank = Bank()
        XCTAssertTrue(sum.reduced(to: "USD", at: bank) == Money.dolor(amount: 11))
    }

    func testSum(){
        let five = Money.dolor(amount: 5)
        let six = Money.dolor(amount: 6)
        let sum = five.plus(six)
        XCTAssertTrue((sum.left as! Money) == five && (sum.right as! Money) == six)
    }
    
    func testSimpleRate(){
        let bank = Bank()
        bank.addRate(from:"USD", to:"CHF", at: 2)
        XCTAssertTrue(bank.reduced(Money.dolor(amount: 1), to:"CHF") == Money.frank(amount: 2))
        XCTAssertTrue(bank.reduced(Money.frank(amount: 2), to: "USD") == Money.dolor(amount: 1))
    }
    
    func testAddSumAndMoney(){
        let five = Money.dolor(amount: 5)
        let six = Money.dolor(amount: 6)
        let sum = five.plus(six)
        let sum1 = sum.plus(five)
        let bank = Bank()
        XCTAssertTrue(sum1.reduced(to: "USD", at: bank) == Money.dolor(amount: 16))
    }
    
    func testMulitiCurrency(){
        let oneDollor = Money.dolor(amount: 1)
        let twoFrank = Money.frank(amount: 2)
        let bank = Bank()
        bank.addRate(from: "USD", to: "CHF", at: 2.0)
        let sum = oneDollor.plus(twoFrank)
        XCTAssertTrue(sum.reduced(to: "CHF", at: bank) == Money.frank(amount: 4))
        XCTAssertTrue(sum.reduced(to: "USD", at: bank) == Money.dolor(amount: 2))
        XCTAssertTrue(bank.reduced(sum, to: "USD") == Money.dolor(amount: 2))
        XCTAssertTrue(bank.reduced(sum, to: "CHF") == Money.frank(amount: 4))
        
    }
    
    
    
}

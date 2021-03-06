//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 蘇健豪1 on 2017/1/23.
//  Copyright © 2017年 Oyster. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
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
    
    func testBinaryOperationPlus() {
        let brain = CalculatorModel()
        brain.setOperand(operand: 4)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 8)
        brain.performOperation(symbol: "=")
        XCTAssert(brain.result == 12)
    }
    
    func testBinaryOperationSubtraction() {
        let brain = CalculatorModel()
        brain.setOperand(operand: 23)
        brain.performOperation(symbol: "-")
        brain.setOperand(operand: 11)
        brain.performOperation(symbol: "=")
        XCTAssert(brain.result == 12)
    }
    
    func testBinaryOperationMultiplication() {
        let brain = CalculatorModel()
        brain.setOperand(operand: 23)
        brain.performOperation(symbol: "×")
        brain.setOperand(operand: 11)
        brain.performOperation(symbol: "=")
        XCTAssert(brain.result == 253)
    }
    
    func testBinaryOperationDivision() {
        let brain = CalculatorModel()
        brain.setOperand(operand: 91)
        brain.performOperation(symbol: "/")
        brain.setOperand(operand: 13)
        brain.performOperation(symbol: "=")
        XCTAssert(brain.result == 7)
    }
}

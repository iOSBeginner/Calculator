//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 蘇健豪1 on 2017/1/24.
//  Copyright © 2017年 Oyster. All rights reserved.
//

import Foundation

class CalculatorModel {
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()  // 執行運算
                pending = pendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)  // 存入暫存區
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    func clear() {
        pending = nil
    }
    
    //MARK: - Operationa
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "+": Operation.BinaryOperation({(op1: Double, op2: Double) -> Double in return op1 + op2 }),
        "-": Operation.BinaryOperation({(op1, op2) in return op1 - op2 }),
        "×": Operation.BinaryOperation({ return $0 * $1 }),
        "/": Operation.BinaryOperation({ $0 / $1 }),
        "=": Operation.Equals
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    //MARK: - Binary Operation
    
    private func executePendingBinaryOperation() {  // 執行運算
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    //MARK: Pending
    
    private var pending: pendingBinaryOperationInfo?
    
    private struct pendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    //MARK: - out put
    
    var result: Double {
        get {
            return accumulator
        }
    }
}

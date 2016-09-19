//
//  CalculatorModel.swift
//  Tipz
//
//  Created by Edmund Korley on 9/19/16.
//  Copyright © 2016 Edmund Korley. All rights reserved.
//

import Foundation

class CalculatorModel {
    private var accumulator = 0.0
    
    // Public method
    func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    // Dictionary for resolving symbols to functionality
    private var operations: Dictionary<String,Operation> = [
        "π": Operation.constant(M_PI),
        "e": Operation.constant(M_E),
        "±": Operation.unaryOperation({ -$0 }),
        "x": Operation.binaryOperation({ $0 * $1 }),
        "-": Operation.binaryOperation({ $0 - $1 }),
        "+": Operation.binaryOperation({ $0 + $1 }),
        "/": Operation.binaryOperation({ $0 / $1 }),
        "=": Operation.equals,
        "C": Operation.clear
    ]
    
    // Enumeration for typing operations
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
        case clear
    }
    
    // Struct, for salting away information for binary operation
    // passed by value (copied) yet actually not copied until attempted manipulation
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    private var pending: PendingBinaryOperationInfo? // Option as only here if we have pending binary op
    
    // Public method
    func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let associatedConstantValue):
                accumulator = associatedConstantValue
            case .unaryOperation(let associatedFunction):
                accumulator = associatedFunction(accumulator)
            case .binaryOperation(let associatedFunction):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: associatedFunction, firstOperand: accumulator)
            case .equals:
                executePendingBinaryOperation()
            case .clear:
                accumulator = 0
            }
        }
    }
    
    // Private helper method
    private func executePendingBinaryOperation()
    {
        if (pending != nil) {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}

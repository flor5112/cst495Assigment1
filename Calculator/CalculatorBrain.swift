//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Miriam Flores on 9/8/16.
//  Copyright © 2016 CSUMB. All rights reserved.
//

//Model class

import Foundation

class CalculatorBrain
{
    
     private enum Op{
        
        case Operand(Double)
        case UnaryOperation(String, Double->Double)
        case BinaryOperation(String, (Double, Double) ->Double)
        
    
    }
    
    private var opStack = [Op]()
    private var knownOps  = [String:Op]()
    
    init()
    {
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["÷"] = Op.BinaryOperation("÷") {$1 / $0}
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−") {$1 - $0}
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    private func evaluate(ops: [Op])-> (results: Double?, remainingOps: [Op]){
    
        if !ops.isEmpty{
            
            var remaindingOps = ops
            
            let op = remaindingOps.removeLast()
            
            switch op {
            case .Operand(let operand):
                return (operand, remaindingOps)
            case .UnaryOperation(..., let operation):
                let
                
            default:
                break
            }
        }
    
        return (nil, ops)
    }
    
    func evaleuate() -> Double? {
        
    }
    
    func pushOperand(operand:Double)
    {
        opStack.append(Op.Operand(operand))
        
    }
    func performOperation(symbol:String){
        
        if let operation = knownOps[symbol]{
            opStack.append(operation)
        }
    }



}

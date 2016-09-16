//
//  ViewController.swift
//  Calculator
//
//  Created by Miriam Flores on 9/7/16.
//  Copyright © 2016 CSUMB. All rights reserved.
//

import UIKit


//definition of a class
// swift single inheritance 
//instance variable -> properties
class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    @IBOutlet weak var history: UILabel!
    
    //tracker∏
    var userIsInTheMiddleOfTypingANumber = false
    //stack
    var operandStack = Array<Double>()
    
    //action for the buttons
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber
        {
            display.text = display.text! + digit
        }
        else
        {
            
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        //print("digit \(digit)")
        
    }
    
    @IBAction func clear() {
        
        display.text = "0"
        history.text = " "
        
    }
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if(userIsInTheMiddleOfTypingANumber)
        {
            enter()
        }
        
        history.text?.appendContentsOf(operation)
        
        switch operation {
            
        case "×": performOperation() { $0 * $1 }

        case "÷": performOperation() { $1 / $0 }
            
        case "−": performOperation() { $1 - $0 }
           
        case "+": performOperation() { $0 + $1 }
            
        case "√ ":performOperation { sqrt($0) }
        
        case "sin": performOperation{ sin($0) }
        
        case "cos": performOperation { cos($0) }
        
        case "∏": display.text = String(M_PI)
            
        default:
            break
        }
        
    }
    
    private func performOperation(operation:(Double,Double) -> Double)
    {
        if(operandStack.count >= 2)
        {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
        
    }
    
    private func performOperation(operation:Double -> Double)
    {
        if(operandStack.count >= 1)
        {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
        
    }
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        history.text?.appendContentsOf(String(displayValue))
       // print("operandStack= \(operandStack)")
    }
    
    
  
    var displayValue: Double{
        get{
            
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
            
            
        }
    }
    
}


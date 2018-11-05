//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Pinar Unsal on 2018-11-04.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    //tuple
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    //set external paramet name to nothing, internal parameter name to number
   mutating func setNumber (_ number: Double) {
        self.number = number
    }
   
    mutating func calculate(symbol: String) -> Double? {

        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation (n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operations = intermediateCalculation?.operation {
            
            switch operations {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}

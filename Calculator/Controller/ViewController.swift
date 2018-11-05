//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Edited by Pinar Unsal on 03/11/2018
//  Copyright © 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let num = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return num
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
                        
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber == true {
                displayLabel.text =  numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    /* Floor - Round down current display value 8.1 to 8
                       compare it with the current display text
                       then isInt becomes false or true */
                    let isInt = floor(displayValue) == Double(displayValue)
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}


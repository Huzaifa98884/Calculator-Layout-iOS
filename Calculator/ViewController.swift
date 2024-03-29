//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    private var isFinishedTyingNumber: Bool = true
    
    private var displayedValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyingNumber = true
        
        calculator.setNumber(displayedValue)
        
        if let calcMethod = sender.currentTitle{
           
            if let result = calculator.calculate(symbol: calcMethod) {
                displayedValue = result
            }
            
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        
        //What should happen when a number is entered into the keypad
       
        if let numValue = sender.currentTitle {
            if isFinishedTyingNumber{
                displayLabel.text = numValue
                isFinishedTyingNumber = false
            }else{
                
                if numValue == "."{
                    
                    let isInt = floor(displayedValue) == displayedValue
                    
                    if !isInt{
                        return
                    }
                }
                
                displayLabel.text! += numValue
            }
            
        }
    
    }

}


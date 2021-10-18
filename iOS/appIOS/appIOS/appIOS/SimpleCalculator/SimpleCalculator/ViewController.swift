//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Varshith Reddy Bairy on 05/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.isHidden = true
        for constraint in self.view.constraints {
            constraint.isActive = false
        }
    }

    @IBAction func addNumbers(_ sender: UIButton) {
        resultLabel.isHidden = false
        let firstNumber = Double(number1.text!)
        let secondNumber = Double(number2.text!)
        if (firstNumber != nil && secondNumber  != nil)
        {
        let output = Double(firstNumber! + secondNumber!)
            resultLabel.text = "   The result is \(output)"
        }
        else{
            resultLabel.text = " Please Enter Numbers"
        }
    }
    
    @IBAction func subtractNumbers(_ sender: UIButton) {
        resultLabel.isHidden = false
        let firstNumber = Double(number1.text!)
        let secondNumber = Double(number2.text!)
        if (firstNumber != nil && secondNumber  != nil)
        {
        let output = Double(firstNumber! - secondNumber!)
            resultLabel.text = "   The result is \(output)"
        }
        else{
            resultLabel.text = " Please Enter Numbers"
        }
    }
    @IBAction func multiplyNumbers(_ sender: UIButton) {
        resultLabel.isHidden = false
        let firstNumber = Double(number1.text!)
        let secondNumber = Double(number2.text!)
        if (firstNumber != nil && secondNumber  != nil)
        {
        let output = Double(firstNumber! * secondNumber!)
            resultLabel.text = "   The result is \(output)"
        }
        else{
            resultLabel.text = " Please Enter Numbers"
        }
    }
    
    @IBAction func devideNumbers(_ sender: UIButton) {
        resultLabel.isHidden = false
        let firstNumber = Double(number1.text!)
        let secondNumber = Double(number2.text!)
        
        if (firstNumber != nil && secondNumber  != nil)
        {
            
        let output = Double(firstNumber! / secondNumber!)
            resultLabel.text = "   The result is \(output)"
            if (secondNumber! == 0){
               resultLabel.text = " Denominator Cant be 0"
           }
        }
        
        else{
            resultLabel.text = " Please Enter Numbers"
        }
    }
    
    @IBAction func clearFields(_ sender: UIButton) {
        
        resultLabel.isHidden = true
        number1.text = ""
        number2.text = ""
        resultLabel.text = ""
    }
}


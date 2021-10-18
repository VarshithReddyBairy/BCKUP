//
//  ViewController.swift
//  Bairy_FormatName
//
//  Created by Bairy,Varshith on 9/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickOfSubmit(_ sender: Any) {
        displayLabel.text = "\(lastNameTextField.text!), \(firstNameTextField.text!)"
        displayLabel.textColor = UIColor.red
        displayLabel.font = UIFont.italicSystemFont(ofSize: 20)
    }
    @IBAction func onClickOfReset(_ sender: Any) {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        displayLabel.text = ""
        firstNameTextField.becomeFirstResponder()
    }
    
}


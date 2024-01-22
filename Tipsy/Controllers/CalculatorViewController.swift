//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberlabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == "0%"{
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
           
        }else if sender.currentTitle == "10%"{
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
          
        }
        else {
            zeroPctButton.isSelected =  false
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        if zeroPctButton.isSelected == true {
            print("tip is 0 % ")
        }
        else if tenPctButton.isSelected == true{
            print("tip is 0.1 % ")
        }
        else if twentyPctButton.isSelected == true{
            print("tip is 0.2 % ")
        }
    }
    


}


//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var tip : Double = 0.0
    var splitBill : Double = 0.0
    var noOfPersons :Double = 0.0
    
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
        print("stepper clicked")
        print(sender.value)
        splitNumberlabel.text = String(format: "%.0f", sender.value)
        
    }
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
       
        if zeroPctButton.isSelected == true {
            tip = 0
            print("tip is 0 % ")
        }
        else if tenPctButton.isSelected == true{
            tip = Double(0.1)
            print("tip is 0.1 % ")
        }
        else if twentyPctButton.isSelected == true{
            tip = Double(0.2)
            print("tip is 0.2 % ")
        }
        print(tip)
        print(splitNumberlabel.text!)
        print(billTextField.text!)
        
        let bill = Double(billTextField.text!)
        noOfPersons = Double(splitNumberlabel.text!)!
        print((bill! + (bill!*tip)))
        splitBill = Double((bill! + (bill!*tip)) / noOfPersons)
        print(splitBill)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVc = segue.destination as! ResultViewController
            destinationVc.totalAmount = splitBill
            destinationVc.noOfPeople = Int(noOfPersons)
            destinationVc.tipPercentage = Int(tip*100)
            
        }
    }
    
    


}


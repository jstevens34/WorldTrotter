//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Joe Stevens on 7/17/16.
//  Copyright © 2016 Joe Stevens. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheitValue: Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }
        else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    var celsiusValue: Double?{
        if let value = fahrenheitValue{
            return (value - 32) * (5/9)
        }
        else{
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue{
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else{
            celsiusLabel.text = "???"
        }
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeperator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeperator = string.rangeOfString(".")
        
        let inverseSet = NSCharacterSet(charactersInString: "0123456789.-").invertedSet
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        let filtered = components.joinWithSeparator("")
        
        
        if existingTextHasDecimalSeperator != nil &&
            replacementTextHasDecimalSeperator != nil{
            return false
        }
        else{
            return string == filtered
        }
    }
    
}

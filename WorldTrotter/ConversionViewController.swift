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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
    }
    
    override func viewWillAppear(animated: Bool) {
        let colors = [
            UIColor(red: 233/255, green: 203/255, blue: 198/255, alpha: 1),
            UIColor(red: 38/255, green: 188/255, blue: 192/255, alpha: 1),
            UIColor(red: 253/255, green: 221/255, blue: 164/255, alpha: 1),
            UIColor(red: 235/255, green: 154/255, blue: 171/255, alpha: 1),
            UIColor(red: 87/255, green: 141/255, blue: 155/255, alpha: 1)
        ]
        
        let randomColor = self.randomColorGenerator()
        self.view.backgroundColor = colors[randomColor]
    }
    

    
    var fahrenheitValue: Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        if let text = textField.text, number = numberFormatter.numberFromString(text){
            fahrenheitValue = number.doubleValue
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
        
        let currentLocale = NSLocale.currentLocale()
        let decimalSeperator =  currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String
        
        let existingTextHasDecimalSeperator = textField.text?.rangeOfString(decimalSeperator)
        let replacementTextHasDecimalSeperator = string.rangeOfString(decimalSeperator)
        
        let inverseSet = NSCharacterSet(charactersInString: "0123456789.- ").invertedSet
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
    
    func randomColorGenerator() -> Int {
        let randomColor = Int(arc4random_uniform(4))
        return randomColor
    }
    
}

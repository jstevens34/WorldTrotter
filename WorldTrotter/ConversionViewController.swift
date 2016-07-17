//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Joe Stevens on 7/17/16.
//  Copyright © 2016 Joe Stevens. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        celsiusLabel.text = textField.text
    }
    
}

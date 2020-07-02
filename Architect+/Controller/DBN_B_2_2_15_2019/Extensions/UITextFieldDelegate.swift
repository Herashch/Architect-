//
//  UITextFieldDelegate.swift
//  Architect+
//
//  Created by Ivan Herashchenko on 02.07.2020.
//  Copyright © 2020 Ivan Herashchenko. All rights reserved.
//

import UIKit

extension DBN_B_2_2_15_2019: UITextFieldDelegate {
    
    @objc func touch() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var stringText = string
        
        if stringText == "," {
            stringText = "."
        }
        
        if (textField.text!.count == 0) && (stringText == ".") {
            return false
        }
        
        let dotsCount = textField.text!.components(separatedBy: ".").count - 1
        
        if (dotsCount > 0) && (stringText == ".") {
            return false
        }
        
        if stringText == "." {
            textField.text = textField.text! + "."
            return false
        }
        
        return true
    }

}

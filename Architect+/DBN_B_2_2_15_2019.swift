//
//  DBN_B_2_2_15_2019.swift
//  Architect+
//
//  Created by Ivan Herashchenko on 29.04.2020.
//  Copyright © 2020 Ivan Herashchenko. All rights reserved.
//

import UIKit

class DBN_B_2_2_15_2019: UIViewController {
    
    var textResult = ""
    
    @IBOutlet var buildingHeight: UITextField!
    @IBOutlet var ThroughAislesDistance: UITextField!
    @IBOutlet var result: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        buildingHeight.delegate = self
        ThroughAislesDistance.delegate = self
    }
    
    @IBAction func checkData(_ sender: Any) {
        textResult = ""
        checkBuildingHeight()
        checkThroughAislesDistance()
        checkResult()
    }
    
    func checkBuildingHeight() {
        guard let operand = Double(buildingHeight.text!) else {
            return
        }
        if operand > 73.5 {
            textResult += " 1,"
        }
    }
    
    func checkThroughAislesDistance() {
        guard let operand = Double(ThroughAislesDistance.text!) else {
            return
        }
        if operand > 100 {
            textResult += " 5.1,"
        }
    }
    
    func checkResult() {
        if textResult == "" {
            result.textColor = .green
            result.text = "Порушень немає"
        } else {
            textResult.remove(at: textResult.index(before: textResult.endIndex))
            result.textColor = .red
            result.text = "Порушення пункту " + textResult + "!"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DBN_B_2_2_15_2019: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buildingHeight.resignFirstResponder()
        ThroughAislesDistance.resignFirstResponder()
        return true
    }
    
}

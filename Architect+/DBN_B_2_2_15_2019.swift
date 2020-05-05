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
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var buildengHeightLabel: UILabel!
    @IBOutlet var throughAislesDistanceLabel: UILabel!
    @IBOutlet var WhereIsTheLivingRoomLabel: UILabel!
    @IBOutlet var residentialHeightLabel: UILabel!
    @IBOutlet var heightOfOtherRoomsLabel: UILabel!
    
    
    @IBOutlet var buildingHeight: UITextField!
    @IBOutlet var ThroughAislesDistance: UITextField!
    @IBOutlet var WhereIsTheLivingRoom: UISegmentedControl!
    @IBOutlet var residentialHeight: UITextField!
    @IBOutlet var residentialHeightSegmentedControl: UISegmentedControl!
    @IBOutlet var heightOfOtherRooms: UITextField!
    
    
    @IBOutlet var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        
        buildingHeight.delegate = self
        ThroughAislesDistance.delegate = self
        residentialHeight.delegate = self
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(recognizer)
        
        
        
    }
    
    @IBAction func checkData(_ sender: Any) {
        textResult = ""
        Paragraph1()
        Paragraph5_2()
        Paragraph5_3()
        Paragraph5_6()
        checkResult()
    }
    
    func Paragraph1() {
        guard let operand = Double(buildingHeight.text!) else {
            return
        }
        if operand > 73.5 {
            buildengHeightLabel.textColor = .red
            textResult += " 1,"
        } else {
            buildengHeightLabel.textColor = .label
        }
    }
    
    func Paragraph5_2() {
        guard let operand = Double(ThroughAislesDistance.text!) else {
            return
        }
        if operand > 100 {
            throughAislesDistanceLabel.textColor = .red
            textResult += " 5.2,"
        } else {
            throughAislesDistanceLabel.textColor = .label
        }
    }
    
    func Paragraph5_3() {
        if WhereIsTheLivingRoom.selectedSegmentIndex != 3 {
            WhereIsTheLivingRoomLabel.textColor = .red
            textResult += " 5.3,"
        } else {
            WhereIsTheLivingRoomLabel.textColor = .label
        }
    }
    
    func Paragraph5_6() {
        guard let operand = Double(residentialHeight.text!) else {
            return
        }
        if residentialHeightSegmentedControl.selectedSegmentIndex == 0 {
            if operand >= 2.7 {
                residentialHeightLabel.textColor = .label
            } else {
                residentialHeightLabel.textColor = .red
                textResult += " 5.6,"
            }
        } else {
            if operand >= 2.5 {
                residentialHeightLabel.textColor = .label
            } else {
                residentialHeightLabel.textColor = .red
                textResult += " 5.6,"
            }
        }
        guard let operand2 = Double(heightOfOtherRooms.text!) else {
            return
        }
        if operand2 >= 2.1 {
            heightOfOtherRoomsLabel.textColor = .label
        } else {
            heightOfOtherRoomsLabel.textColor = .red
            if !textResult.contains(" 5.6,") {
                textResult += " 5.6,"
            }
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

}

extension DBN_B_2_2_15_2019: UITextFieldDelegate {
    
    @objc func touch() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text!.count == 0) && (string == ".") {
            return false
        }
        let dotsCount = textField.text!.components(separatedBy: ".").count - 1
        if (dotsCount > 0) && (string == ".") {
            return false
        }
        return true
    }

}

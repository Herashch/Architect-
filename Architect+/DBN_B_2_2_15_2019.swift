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
    @IBOutlet var heightCeilingFloorLabel: UILabel!
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
        heightOfOtherRooms.delegate = self
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(recognizer)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
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
        buildengHeightLabel.textColor = .label
        guard let operand = Double(buildingHeight.text!) else {
            return
        }
        if operand > 73.5 {
            buildengHeightLabel.textColor = .red
            textResult += " 1,"
        }
    }
    
    func Paragraph5_2() {
        throughAislesDistanceLabel.textColor = .label
        guard let operand = Double(ThroughAislesDistance.text!) else {
            return
        }
        if operand > 100 {
            throughAislesDistanceLabel.textColor = .red
            textResult += " 5.2,"
        }
    }
    
    func Paragraph5_3() {
        WhereIsTheLivingRoomLabel.textColor = .label
        if WhereIsTheLivingRoom.selectedSegmentIndex != 3 {
            WhereIsTheLivingRoomLabel.textColor = .red
            textResult += " 5.3,"
        }
    }
    
    func Paragraph5_6() {
        residentialHeightLabel.textColor = .label
        heightCeilingFloorLabel.textColor = .label
        Paragraph5_6two()
        guard let operand = Double(residentialHeight.text!) else {
            return
        }
        if residentialHeightSegmentedControl.selectedSegmentIndex == 0 {
            if operand < 2.7 {
                residentialHeightLabel.textColor = .red
                heightCeilingFloorLabel.textColor = .red
                if !textResult.contains(" 5.6,") {
                    textResult += " 5.6,"
                }
            }
        } else {
            if operand < 2.5 {
                residentialHeightLabel.textColor = .red
                heightCeilingFloorLabel.textColor = .red
                if !textResult.contains(" 5.6,") {
                    textResult += " 5.6,"
                }
            }
        }
    }
    
    func Paragraph5_6two() {
        heightOfOtherRoomsLabel.textColor = .label
        guard let operand2 = Double(heightOfOtherRooms.text!) else {
            return
        }
        if operand2 < 2.1 {
            heightOfOtherRoomsLabel.textColor = .red
            residentialHeightLabel.textColor = .red
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

extension DBN_B_2_2_15_2019 {
    @objc func keyboardWillShow(notification:NSNotification){

        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification){

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}


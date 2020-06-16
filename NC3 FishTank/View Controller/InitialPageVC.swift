//
//  InitialPageVC.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 15/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit

class InitialPageVC: UIViewController {
    
    @IBOutlet weak var textProlog1: UILabel!
    @IBOutlet weak var textProlog2: UILabel!
    @IBOutlet weak var textProlog3: UILabel!
    @IBOutlet weak var textInsertName: UILabel!
    
    @IBOutlet weak var fieldInsertName: UITextField!
    
    @IBOutlet weak var buttonNext1: UIButton!
    @IBOutlet weak var buttonNext2: UIButton!
    @IBOutlet weak var buttonNext3: UIButton!
    @IBOutlet weak var buttonContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.hideKeyboardWhenTappedAround()
        
        view.addGestureRecognizer(tap)
        
        buttonNext1.layer.cornerRadius = 19
        buttonNext2.layer.cornerRadius = 19
        buttonNext3.layer.cornerRadius = 19
        buttonContinue.layer.cornerRadius = 19
        
        textInsertName.isHidden = true
        
        fieldInsertName.isHidden = true
        buttonContinue.isHidden = true
        
        buttonNext2.isHidden = true
        buttonNext3.isHidden = true
        textProlog2.isHidden = true
        textProlog3.isHidden = true
        
        textProlog1.setTextWithTypeAnimation(typedText: textProlog1.text ?? "May the source be with you", characterInterval: 0.05)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickButtonNext1(_ sender: Any) {
        textProlog1.isHidden = true
        textProlog2.isHidden = false
        buttonNext1.isHidden = true
        buttonNext2.isHidden = false
        textProlog2.setTextWithTypeAnimation(typedText: textProlog2.text ?? "May the source be with you", characterInterval: 0.05)
    }
    
    @IBAction func clickButtonNext2(_ sender: Any) {
        textProlog2.isHidden = true
        textProlog3.isHidden = false
        buttonNext2.isHidden = true
        buttonNext3.isHidden = false
        textProlog3.setTextWithTypeAnimation(typedText: textProlog3.text ?? "May the source be with you", characterInterval: 0.05)
    }
    
    @IBAction func clickButtonNext3(_ sender: UIButton) {
        textProlog3.isHidden = true
        buttonNext3.isHidden = true
        
        textInsertName.isHidden = false
        fieldInsertName.isHidden = false
        buttonContinue.isHidden = false
    }
    
    @IBAction func clickButtonContinue(_ sender: UIButton) {
        if fieldInsertName.text == ""{
            warning()
        }else{
            textInsertName.isHidden = true
            fieldInsertName.isHidden = true
            buttonContinue.isHidden = true
            charName = fieldInsertName.text!
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    func warning(){
        let alert = UIAlertController(title: "Warning", message: "You cannot leave your name empty", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

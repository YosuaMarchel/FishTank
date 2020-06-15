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
    
    @IBOutlet weak var fieldInsetName: UITextField!
    
    @IBOutlet weak var buttonNext1: UIButton!
    @IBOutlet weak var buttonNext2: UIButton!
    @IBOutlet weak var buttonNext3: UIButton!
    @IBOutlet weak var buttonContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        buttonNext1.layer.cornerRadius = 19
        buttonNext2.layer.cornerRadius = 19
        buttonNext3.layer.cornerRadius = 19
        buttonContinue.layer.cornerRadius = 19
        
        textInsertName.isHidden = true
        
        fieldInsetName.isHidden = true
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
        fieldInsetName.isHidden = false
        buttonContinue.isHidden = false
    }
    
    @IBAction func clickButtonContinue(_ sender: UIButton) {
        textInsertName.isHidden = true
        fieldInsetName.isHidden = true
        buttonContinue.isHidden = true
                
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
}

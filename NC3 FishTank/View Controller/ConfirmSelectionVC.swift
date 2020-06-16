//
//  ConfirmSelectionVC.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 15/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit



class ConfirmSelectionVC: UIViewController {
    
    @IBOutlet weak var imageClass: UIImageView!
    @IBOutlet weak var labelClass: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonYes: UIButton!
    @IBOutlet weak var buttonNo: UIButton!
    
    var charSelection: String = ""
    var indexSelected: Int = 0
    var status = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonYes.layer.cornerRadius = 19
        buttonNo.layer.cornerRadius = 19
        
        if charSelection == "fighter"{
            imageClass.image = UIImage(named: "Fighter")
            labelClass.text = "Fighter"
            labelDescription.text = "Fighters are a versatile, weapon-oriented warrior who fights using skill, strategy, and tactics."
            indexSelected = 1
        }else if charSelection == "wizard"{
            imageClass.image = UIImage(named: "Wizard")
            labelClass.text = "Wizard"
            labelDescription.text = "Wizards is supreme magic-users, defined and united as a class by the spell they cast."
            indexSelected = 2
        }else if charSelection == "cleric"{
            imageClass.image = UIImage(named: "Cleric")
            labelClass.text = "Cleric"
            labelDescription.text = "Clerics are intermediaries between the mortal world and distant planes of the gods."
            indexSelected = 3
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonYes(_ sender: UIButton) {
        status = true
        performSegue(withIdentifier: "backToPick", sender: self)
    }
    
    @IBAction func buttonNo(_ sender: UIButton) {
        status = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PickClassVC{
            if status {
                destination.indexSelected = self.indexSelected
            }
        }
    }
    
}

//
//  PickClassVC.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 15/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit

class PickClassVC: UIViewController {

    @IBOutlet weak var buttonStartAdventure: UIButton!
    @IBOutlet weak var imageFighter: UIImageView!
    @IBOutlet weak var imageWizard: UIImageView!
    @IBOutlet weak var imageCleric: UIImageView!
    @IBOutlet weak var buttonFighter: UIButton!
    @IBOutlet weak var buttonWizard: UIButton!
    @IBOutlet weak var buttonCleric: UIButton!
    
    var charSelection: String = ""
    var indexSelected: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonStartAdventure.layer.cornerRadius = 19
        buttonStartAdventure.isHidden = true
        
        if indexSelected == 1 {
            self.imageFighter.image = UIImage(named: "fighter_selected")
            self.buttonFighter.isHidden = true
            self.buttonWizard.isHidden = true
            self.imageWizard.alpha = 0.5
            self.buttonCleric.isHidden = true
            self.imageCleric.alpha = 0.5
            buttonStartAdventure.isHidden = false
            charClassSelection = "fighter"
        }else if indexSelected == 2 {
            self.imageWizard.image = UIImage(named: "wizard_selected")
            self.buttonWizard.isHidden = true
            self.buttonFighter.isHidden = true
            self.imageFighter.alpha = 0.5
            self.buttonCleric.isHidden = true
            self.imageCleric.alpha = 0.5
            buttonStartAdventure.isHidden = false
            charClassSelection = "wizard"
        }else if indexSelected == 3 {
            self.imageCleric.image = UIImage(named: "cleric_selected")
            self.buttonCleric.isHidden = true
            self.buttonFighter.isHidden = true
            self.imageFighter.alpha = 0.5
            self.buttonWizard.isHidden = true
            self.imageWizard.alpha = 0.5
            buttonStartAdventure.isHidden = false
            charClassSelection = "cleric"
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickButtonFighter(_ sender: UIButton) {
        charSelection = "fighter"
        performSegue(withIdentifier: "fighterselected", sender: self)
    }
    
    @IBAction func clickButtonWizard(_ sender: UIButton) {
        charSelection = "wizard"
        performSegue(withIdentifier: "wizardselected", sender: self)
    }
    
    @IBAction func clickButtonCleric(_ sender: UIButton) {
        charSelection = "cleric"
        performSegue(withIdentifier: "clericselected", sender: self)
    }
    
    @IBAction func clickButtonStartAdventure(_ sender: Any) {
        backgroundMusicPlayer.stop()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConfirmSelectionVC{
            destination.charSelection = self.charSelection
        }
    }
}



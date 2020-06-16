//
//  StoryVC.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 15/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit

class StoryVC: UIViewController {

    @IBOutlet weak var imagePlayer: UIImageView!
    @IBOutlet weak var imageFace: UIImageView!
    @IBOutlet weak var imageNPC: UIImageView!
    @IBOutlet weak var labelMonolog: UILabel!
    @IBOutlet weak var labelDialogChar: UILabel!
    @IBOutlet weak var labelNPCName: UILabel!
    @IBOutlet weak var labelCharName: UILabel!
    @IBOutlet weak var labelDialogNPC: UILabel!
    @IBOutlet weak var viewChat: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePlayer.isHidden = true
        imageNPC.isHidden = true
        imageFace.isHidden = true
        labelNPCName.isHidden = true
        labelCharName.isHidden = true
        labelDialogChar.isHidden = true
        viewChat.layer.cornerRadius = 19
        
        if charClassSelection == "fighter"{
            imagePlayer.image = UIImage(named: "FighterRight")
            imageFace.image = UIImage(named: "FighterFace")
        }else if charClassSelection == "wizard"{
            imagePlayer.image = UIImage(named: "WizardRight")
            imageFace.image = UIImage(named: "WizardFace")
        }else if charClassSelection == "cleric"{
            imagePlayer.image = UIImage(named: "ClericRight")
            imageFace.image = UIImage(named: "ClericFace")
        }
        
        playMonolog(text: "You finally arrived at XYZ Village.")

    }
    
    
    @IBAction func clickButtonNext(_ sender: UIButton) {
        labelCharName.text = charName
        if labelMonolog.text == "You finally arrived at Deepwood Village."{
            playMonolog(text: "You see someone waiting for you at the gate.")
        }else if labelMonolog.text == "You see someone waiting for you at the gate."{
            playDialogNPC(text: "Hello \(charName).")
            imageNPC.isHidden = false
            imagePlayer.isHidden = false
            labelNPCName.text = "Village adventurer"
            labelMonolog.text = ""
            imageNPC.image = UIImage(named: "WelcomingNPC")
        }else if labelDialogNPC.text == "Hello \(charName)."{
            playDialogNPC(text: "I've been expecting you.")
        }else if labelDialogNPC.text == "I've been expecting you."{
            playDialogChar(text: "It was quite a journey coming here . . .")
            imagePlayer.isHidden = false
            imageFace.isHidden = false
            labelDialogNPC.text = ""
        }else if labelDialogChar.text == "It was quite a journey coming here . . ."{
            playDialogNPC(text: "Get some rest at the tavern first. Then you can gather some information about the raids that has been happening in this village.")
            labelDialogChar.text = ""
        }else if labelDialogNPC.text == "Get some rest at the tavern first. Then you can gather some information about the raids that has been happening in this village."{
            performSegue(withIdentifier: "toVillageVC", sender: self)
        }
        
    }
    
    func playMonolog (text: String){
        labelMonolog.isHidden = false
        imagePlayer.isHidden = true
        imageNPC.isHidden = true
        imageFace.isHidden = true
        labelNPCName.isHidden = true
        labelCharName.isHidden = true
        labelDialogChar.isHidden = true
        labelDialogNPC.isHidden = true
        labelMonolog.setTextWithTypeAnimation(typedText: text, characterInterval: 0.03)
    }
    
    func playDialogChar(text: String){
        labelMonolog.isHidden = true
        imageFace.isHidden = false
        labelNPCName.isHidden = true
        labelCharName.isHidden = false
        labelDialogChar.isHidden = false
        labelDialogNPC.isHidden = true
        labelDialogChar.setTextWithTypeAnimation(typedText: text, characterInterval: 0.03)
    }
    
    func playDialogNPC (text: String){
        labelMonolog.isHidden = true
        imageFace.isHidden = true
        labelNPCName.isHidden = false
        labelCharName.isHidden = true
        labelDialogChar.isHidden = true
        labelDialogNPC.isHidden = false
        labelDialogNPC.setTextWithTypeAnimation(typedText: text, characterInterval: 0.03)
    }
    

  

}

//
//  TavernVC.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 16/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit

class TavernVC: UIViewController {
    
    @IBOutlet weak var imagePlayer: UIImageView!
    @IBOutlet weak var imageFace: UIImageView!
    @IBOutlet weak var imageNPC: UIImageView!
    @IBOutlet weak var labelMonolog: UILabel!
    @IBOutlet weak var labelDialogChar: UILabel!
    @IBOutlet weak var labelNPCName: UILabel!
    @IBOutlet weak var labelCharName: UILabel!
    @IBOutlet weak var labelDialogNPC: UILabel!
    @IBOutlet weak var viewChat: UIView!
    @IBOutlet weak var buttonQuestion1: UIButton!
    @IBOutlet weak var buttonQuestion2: UIButton!
    @IBOutlet weak var labelQuestion1: UILabel!
    @IBOutlet weak var labelQuestion2: UILabel!
    @IBOutlet weak var buttonQuestion3: UIButton!
    @IBOutlet weak var labelQuestion3: UILabel!
    
    
    var counterProgress: Int = 0
    var counterQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePlayer.isHidden = true
        imageNPC.isHidden = true
        imageFace.isHidden = true
        labelNPCName.isHidden = true
        labelCharName.isHidden = true
        labelDialogChar.isHidden = true
        viewChat.layer.cornerRadius = 19
        
        buttonQuestion1.layer.cornerRadius = 10
        buttonQuestion2.layer.cornerRadius = 10
        buttonQuestion3.layer.cornerRadius = 10
        
        buttonQuestion1.isHidden = true
        buttonQuestion2.isHidden = true
        labelQuestion1.isHidden = true
        labelQuestion2.isHidden = true
        buttonQuestion3.isHidden = true
        labelQuestion3.isHidden = true
        
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
        
        playMonolog(text: "As you enter the tavern, you can see that it is crowded at the moment.")
        
    }
    
    @IBAction func clickButtonNext(_ sender: UIButton) {
        labelCharName.text = charName
        if labelMonolog.text == "As you enter the tavern, you can see that it is crowded at the moment."{
            playMonolog(text: "It took a while before the pink haired barmaid notices you and give you a smile.")
        }else if labelMonolog.text == "It took a while before the pink haired barmaid notices you and give you a smile."{
            playDialogNPC(text: "Hello! You are new around here, aren't you? What can I get you?")
            imageNPC.image = UIImage(named: "BarMaid")
            labelNPCName.text = "Bar Maid"
            labelMonolog.text = ""
            imageNPC.isHidden = false
            imagePlayer.isHidden = false
        }else if labelDialogNPC.text == "Hello! You are new around here, aren't you? What can I get you?"{
            playDialogChar(text: "Just give me water please.")
            labelDialogNPC.text = ""
        }else if labelDialogChar.text == "Just give me water please."{
            playDialogNPC(text: "Coming right up! Just take your seat.")
            labelDialogChar.text = ""
        }else if labelDialogNPC.text == "Coming right up! Just take your seat."{
            playMonolog(text: "You pick whatever seat is empty. Not long after, you see the barmaid come with your water.")
            labelDialogNPC.text = ""
        }else if labelMonolog.text == "You pick whatever seat is empty. Not long after, you see the barmaid come with your water."{
            playMonolog(text: "You utter a 'thank you' to the barmaid before you quickly finish your water.")
        }else if labelMonolog.text == "You utter a 'thank you' to the barmaid before you quickly finish your water."{
            playDialogChar(text: "Say, can I ask you something?")
            labelMonolog.text = ""
            imagePlayer.isHidden = false
            imageNPC.isHidden = false
        }else if labelDialogChar.text == "Say, can I ask you something?"{
            playDialogNPC(text: "Sure, what can I help you?")
            labelDialogChar.text = ""
        }else if labelDialogNPC.text == "Sure, what can I help you?"{
            buttonQuestion1.isHidden = false
            buttonQuestion2.isHidden = false
            labelQuestion1.isHidden = false
            labelQuestion2.isHidden = false
            labelQuestion1.text = "Do you know anything about the raid?"
            labelQuestion2.text = "Do you know what has been taken from the village?"
        }else if labelDialogNPC.text == "It's been happening frequently. And it's always after sundown. I don't know much about the culprit because I never go out at night."{
            if counterQuestion == 1 {
                buttonQuestion1.isHidden = false
                buttonQuestion2.isHidden = false
                labelQuestion1.isHidden = false
                labelQuestion2.isHidden = false
                labelQuestion1.text = "Do you know anything about the raid?"
                labelQuestion2.text = "Do you know what has been taken from the village?"
            }else if counterQuestion > 1{
                buttonQuestion1.isHidden = false
                buttonQuestion2.isHidden = false
                labelQuestion1.isHidden = false
                labelQuestion2.isHidden = false
                labelQuestion1.text = "Do you know anything about the raid?"
                labelQuestion2.text = "Do you know what has been taken from the village?"
                buttonQuestion3.isHidden = false
                labelQuestion3.isHidden = false
                labelQuestion3.text = "Appreciate the insight. Maybe I should visit the Village Chief."
            }
        }else if labelDialogNPC.text == "Mostly our harvest. Sometimes livestocks went missing as well. There is one time when the chief's son got injured during the raid. Maybe the chief can give you more info."{
            if counterQuestion == 1 {
                buttonQuestion1.isHidden = false
                buttonQuestion2.isHidden = false
                labelQuestion1.isHidden = false
                labelQuestion2.isHidden = false
                labelQuestion1.text = "Do you know anything about the raid?"
                labelQuestion2.text = "Do you know what has been taken from the village?"
            }else if counterQuestion > 1{
                buttonQuestion1.isHidden = false
                buttonQuestion2.isHidden = false
                labelQuestion1.isHidden = false
                labelQuestion2.isHidden = false
                labelQuestion1.text = "Do you know anything about the raid?"
                labelQuestion2.text = "Do you know what has been taken from the village?"
                buttonQuestion3.isHidden = false
                labelQuestion3.isHidden = false
                labelQuestion3.text = "Appreciate the insight. Maybe I should visit the Village Chief."
            }
        }else if labelDialogNPC.text == "Alright, hope you can help us find the culprit."{
            if counterProgress == 0{
                counterProgress = 1
            }
            performSegue(withIdentifier: "backToVillage1", sender: self)
        }
    }
    
    @IBAction func clickButtonQ1(_ sender: UIButton) {
        buttonQuestion1.isHidden = true
        buttonQuestion2.isHidden = true
        labelQuestion1.isHidden = true
        labelQuestion2.isHidden = true
        playDialogNPC(text: "It's been happening frequently. And it's always after sundown. I don't know much about the culprit because I never go out at night.")
        if counterQuestion == 0{
            counterQuestion += 1
        }else if counterQuestion > 0{
            counterQuestion += 1
            buttonQuestion3.isHidden = true
            labelQuestion3.isHidden = true
        }
    }
    
    @IBAction func clickButtonQ2(_ sender: UIButton) {
        buttonQuestion1.isHidden = true
        buttonQuestion2.isHidden = true
        labelQuestion1.isHidden = true
        labelQuestion2.isHidden = true
        playDialogNPC(text: "Mostly our harvest. Sometimes livestocks went missing as well. There is one time when the chief's son got injured during the raid. Maybe the chief can give you more info.")
        if counterQuestion == 0{
            counterQuestion += 1
        }else if counterQuestion > 0{
            counterQuestion += 1
            buttonQuestion3.isHidden = true
            labelQuestion3.isHidden = true
        }
    }
    
    @IBAction func clickButtonQ3(_ sender: UIButton) {
        buttonQuestion1.isHidden = true
        buttonQuestion2.isHidden = true
        labelQuestion1.isHidden = true
        labelQuestion2.isHidden = true
        buttonQuestion3.isHidden = true
        labelQuestion3.isHidden = true
        playDialogNPC(text: "Alright, hope you can help us find the culprit.")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VillageVC{
            destination.counterProgress = self.counterProgress
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

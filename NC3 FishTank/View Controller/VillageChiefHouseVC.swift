//
//  VillageChiefHouseVC.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 16/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit

class VillageChiefHouseVC: UIViewController {
    
    @IBOutlet weak var imagePlayer: UIImageView!
    @IBOutlet weak var imageFace: UIImageView!
    @IBOutlet weak var imageNPC: UIImageView!
    @IBOutlet weak var labelMonolog: UILabel!
    @IBOutlet weak var labelDialogChar: UILabel!
    @IBOutlet weak var labelNPCName: UILabel!
    @IBOutlet weak var labelCharName: UILabel!
    @IBOutlet weak var labelDialogNPC: UILabel!
    @IBOutlet weak var viewChat: UIView!
    
    var counterProgress: Int = 0
    
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
        
        playMonolog(text: "You knock on the Village Chief's door. You hear Village Chief's voice from inside, telling you to wait.")
    }
    
    @IBAction func clickButtonNext(_ sender: UIButton) {
        labelCharName.text = charName
        if labelMonolog.text == "You knock on the Village Chief's door. You hear Village Chief's voice from inside, telling you to wait."{
            playMonolog(text: "Few minutes later, the door is opened. You can see a man with grey hair and tired face behind the door.")
        }else if labelMonolog.text == "Few minutes later, the door is opened. You can see a man with grey hair and tired face behind the door."{
            labelMonolog.text = ""
            imageNPC.isHidden = false
            imagePlayer.isHidden = false
            labelNPCName.text = "Village Chief"
            playDialogNPC(text: "Yes . . . ? How can I help you?")
        }else if labelDialogNPC.text == "Yes . . . ? How can I help you?"{
            labelDialogNPC.text = ""
            playDialogChar(text: "Hello Chief, my name is \(charName). I was sent here to investigate the raid you've been enduring this past few weeks")
        }else if labelDialogChar.text == "Hello Chief, my name is \(charName). I was sent here to investigate the raid you've been enduring this past few weeks"{
            labelDialogChar.text = ""
            playDialogNPC(text: "Oh . . . So you're the person that the guild sent to help us. Come on in.")
        }else if labelDialogNPC.text == "Oh . . . So you're the person that the guild sent to help us. Come on in."{
            labelDialogNPC.text = ""
            playMonolog(text: "You stepped into his house and look around. You can see that his house is quite in disarray. Papers laying around and there is some bloodied bandages as well.")
        }else if labelMonolog.text == "You stepped into his house and look around. You can see that his house is quite in disarray. Papers laying around and there is some bloodied bandages as well."{
            playMonolog(text: "The chief follow your gaze and give a big sigh.")
        }else if labelMonolog.text == "The chief follow your gaze and give a big sigh."{
            imageNPC.isHidden = false
            imagePlayer.isHidden = false
            labelMonolog.text = ""
            playDialogNPC(text: "I'm sorry for the messiness. My son was recently got hurt when there was an attack yesterday night.")
        }else if labelDialogNPC.text == "I'm sorry for the messiness. My son was recently got hurt when there was an attack yesterday night."{
            labelDialogNPC.text = ""
            playDialogChar(text: "My deepest condolences. I hope that I can solve this problem for you. I might need some information about the attack.")
        }else if labelDialogChar.text == "My deepest condolences. I hope that I can solve this problem for you. I might need some information about the attack."{
            labelDialogChar.text = ""
            playDialogNPC(text: "We never really saw the attacker. Because they always attack under the cover of night.")
        }else if labelDialogNPC.text == "We never really saw the attacker. Because they always attack under the cover of night."{
            playDialogNPC(text: "My son got pretty unusual wound like a bite wound. And there are some scratches on his body on top of the wound that looks like a stab wound.")
        }else if labelDialogNPC.text == "My son got pretty unusual wound like a bite wound. And there are some scratches on his body on top of the wound that looks like a stab wound."{
            labelDialogNPC.text = ""
            playDialogChar(text: "Is it possible that animals were attacking your villages?")
        }else if labelDialogChar.text == "Is it possible that animals were attacking your villages?"{
            labelDialogChar.text = ""
            playDialogNPC(text: "I don't think so . . . The attack seem too organized. The thing that attacked us must be sentient. Maybe you can ask your fellow adventurers at the guild.")
        }else if labelDialogNPC.text == "I don't think so . . . The attack seem too organized. The thing that attacked us must be sentient. Maybe you can ask your fellow adventurers at the guild."{
            labelDialogNPC.text = ""
            playDialogChar(text: "All right, I'll do that. Thank you for the information.")
        }else if labelDialogChar.text == "All right, I'll do that. Thank you for the information."{
            if counterProgress == 1{
                counterProgress = 2
            }
            performSegue(withIdentifier: "backToVillage2", sender: self)
        }
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

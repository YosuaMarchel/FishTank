//
//  AdventurerGuildVC.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 16/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit

class AdventurerGuildVC: UIViewController {
    
    @IBOutlet weak var imagePlayer: UIImageView!
    @IBOutlet weak var imageFace: UIImageView!
    @IBOutlet weak var imageNPC: UIImageView!
    @IBOutlet weak var labelMonolog: UILabel!
    @IBOutlet weak var labelDialogChar: UILabel!
    @IBOutlet weak var labelNPCName: UILabel!
    @IBOutlet weak var labelCharName: UILabel!
    @IBOutlet weak var labelDialogNPC: UILabel!
    @IBOutlet weak var viewChat: UIView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var labelTBC: UILabel!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var labelNext: UILabel!
    
    var counterProgress: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTBC.isHidden = true
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
        
        playMonolog(text: "You walk into the stone building that houses other adventurers.")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickButtonNext(_ sender: UIButton) {
        labelCharName.text = charName
        if labelMonolog.text == "You walk into the stone building that houses other adventurers."{
            playMonolog(text: "You bump up with an adventurer inside the guild. He glares at you with a scary looking face.")
        }else if labelMonolog.text == "You bump up with an adventurer inside the guild. He glares at you with a scary looking face."{
            labelMonolog.text = ""
            imagePlayer.isHidden = false
            imageNPC.isHidden = false
            labelNPCName.text = "Guild Leader"
            imageNPC.image = UIImage(named: "GuildLeader")
            playDialogNPC(text: "Use your eyes kid! Don't you know that I'm an important guy around here ? ? ?")
        }else if labelDialogNPC.text == "Use your eyes kid! Don't you know that I'm an important guy around here ? ? ?"{
            labelDialogNPC.text = ""
            playDialogChar(text: "I'm sorry . . . I just arrived a few hours ago.")
        }else if labelDialogChar.text == "I'm sorry . . . I just arrived a few hours ago."{
            labelDialogChar.text = ""
            playDialogNPC(text: "Ohhh, so you're the wannabe adventurer. What do you want kid?")
        }else if labelDialogNPC.text == "Ohhh, so you're the wannabe adventurer. What do you want kid?"{
            labelDialogNPC.text = ""
            playDialogChar(text: ". . . The Village Chief told me that you might have an idea of what creature that's been attacking the village for the past few weeks.")
        }else if labelDialogChar.text == ". . . The Village Chief told me that you might have an idea of what creature that's been attacking the village for the past few weeks."{
            playDialogChar(text: "He said his son's wounds consist of bite, scratch and stab wound. Do you know creatures that can leave wounds like that?")
        }else if labelDialogChar.text == "He said his son's wounds consist of bite, scratch and stab wound. Do you know creatures that can leave wounds like that?"{
            labelDialogChar.text = ""
            playDialogNPC(text: "Now that I think about it, It might be goblin that attacked the village. The usually carry daggers with them. Not to mention that they have sharp nails and fangs.")
        }else if labelDialogNPC.text == "Now that I think about it, It might be goblin that attacked the village. The usually carry daggers with them. Not to mention that they have sharp nails and fangs."{
            playDialogNPC(text: "I saw some unusual footprints in the forest few days ago. I never saw that kind of footprints in the forest. There might be a hoard of goblins nearby.")
        }else if labelDialogNPC.text == "I saw some unusual footprints in the forest few days ago. I never saw that kind of footprints in the forest. There might be a hoard of goblins nearby."{
            playDialogNPC(text: "You go investigate it. It's part of your quest to get your certificate right? Report back here with whatever informations that you got from there.")
        }else if labelDialogNPC.text == "You go investigate it. It's part of your quest to get your certificate right? Report back here with whatever informations that you got from there."{
            playDialogNPC(text: "Got it?")
        }else if labelDialogNPC.text == "Got it?"{
            labelDialogNPC.text = ""
            playDialogChar(text: "Yes sir . . .")
        }else if labelDialogChar.text == "Yes sir . . ."{
            playMusic(title: "Nocturnal_Mysteries")
            backgroundMusicPlayer.play()
            imageBackground.image = UIImage(named: "Ending")
            imagePlayer.isHidden = false
            labelDialogChar.text = ""
            playMonolog(text: "With that newfound information, you know that the culprit behind these attacks might be goblins.")
        }else if labelMonolog.text == "With that newfound information, you know that the culprit behind these attacks might be goblins."{
            playMonolog(text: "You never fought with goblins before, so it's best to plan your next action carefully . . .")
            imagePlayer.isHidden = false
        }else if labelMonolog.text == "You never fought with goblins before, so it's best to plan your next action carefully . . ."{
            labelTBC.isHidden = false
            imagePlayer.isHidden = true
            viewChat.isHidden = true
            labelMonolog.isHidden = true
            buttonNext.isHidden = true
            labelNext.isHidden = true
        }
    }
    
    @IBAction func clickButtonBack(_ sender: Any) {
        if counterProgress == 2{
            counterProgress = 3
        }
        performSegue(withIdentifier: "backToVillage3", sender: self)
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

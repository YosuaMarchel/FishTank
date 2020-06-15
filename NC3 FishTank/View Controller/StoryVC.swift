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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePlayer.isHidden = true
        imageNPC.isHidden = true
        imageFace.isHidden = true
        labelNPCName.isHidden = true
        labelCharName.isHidden = true
        labelDialogChar.isHidden = true
        
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
        
        
        
        // Do any additional setup after loading the view.
    }
    

  

}

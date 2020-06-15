//
//  VillageVC.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 16/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit

class VillageVC: UIViewController {
    
    @IBOutlet weak var buttonTavern: UIButton!
    @IBOutlet weak var buttonChiefHouse: UIButton!
    @IBOutlet weak var buttonGuild: UIButton!
    
    var counterProgress: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonTavern.layer.cornerRadius = 10
        buttonGuild.layer.cornerRadius = 10
        buttonChiefHouse.layer.cornerRadius = 10


        buttonChiefHouse.isEnabled = false
        buttonChiefHouse.alpha = 0.5
        buttonGuild.isEnabled = false
        buttonGuild.alpha = 0.5
        if counterProgress == 1{
            buttonChiefHouse.isEnabled = true
            buttonChiefHouse.alpha = 1
        }else if counterProgress == 2{
            buttonGuild.isEnabled = true
            buttonGuild.alpha = 1
            buttonChiefHouse.isEnabled = true
            buttonChiefHouse.alpha = 1
        }else if counterProgress == 3{
            buttonGuild.isEnabled = true
            buttonGuild.alpha = 1
            buttonChiefHouse.isEnabled = true
            buttonChiefHouse.alpha = 1
        }else if counterProgress == 4{
            buttonGuild.isEnabled = true
            buttonGuild.alpha = 1
            buttonChiefHouse.isEnabled = true
            buttonChiefHouse.alpha = 1
        }
    }
    
    @IBAction func clickButtonTavern(_ sender: UIButton) {
        performSegue(withIdentifier: "toTavern", sender: self)
    }
    
    @IBAction func clickButtonChiefHouse(_ sender: UIButton) {
        performSegue(withIdentifier: "toChiefHouse", sender: self)
    }
    
    @IBAction func clickButtonGuild(_ sender: UIButton) {
        performSegue(withIdentifier: "toGuild", sender: self)
    }
    
    @IBAction func clickButtonFarm(_ sender: UIButton) {
        performSegue(withIdentifier: "toFarm", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TavernVC {
            destination.counterProgress = self.counterProgress
        }else if let destination = segue.destination as? VillageChiefHouseVC {
            destination.counterProgress = self.counterProgress
        }else if let destination = segue.destination as? AdventurerGuildVC {
            destination.counterProgress = self.counterProgress
        }
    }
}

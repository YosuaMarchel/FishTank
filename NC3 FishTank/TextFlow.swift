//
//  TextFlow.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 15/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit

extension UILabel{

func setTextWithTypeAnimation(typedText: String, characterInterval: TimeInterval) {
    text = ""
    DispatchQueue.global(qos: .userInteractive).async {

        for character in typedText {
            DispatchQueue.main.async {
                self.text = self.text! + String(character)
            }
            Thread.sleep(forTimeInterval: characterInterval)
        }

    }
}

}

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
                let attributedString = NSMutableAttributedString(string: self.text ?? "")

                // *** Create instance of `NSMutableParagraphStyle`
                let paragraphStyle = NSMutableParagraphStyle()

                // *** set LineSpacing property in points ***
                paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points

                // *** Apply attribute to string ***
                attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

                // *** Set Attributed String to your label ***
                self.attributedText = attributedString
            }
            Thread.sleep(forTimeInterval: characterInterval)
        }

    }
}

}

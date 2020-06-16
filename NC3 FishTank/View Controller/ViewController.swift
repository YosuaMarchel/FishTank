//
//  ViewController.swift
//  NC3 FishTank
//
//  Created by Yosua Marchel on 11/06/20.
//  Copyright © 2020 Yosua Marchel. All rights reserved.
//

import UIKit
import AVFoundation

var backgroundMusicPlayer:AVAudioPlayer = AVAudioPlayer()
var charName: String = ""
var charClassSelection: String = ""

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonStart.layer.cornerRadius = 19
        
        playMusic(title: "Celestial")
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    }
}

extension UIViewController{
    func playMusic(title: String){
        let path = Bundle.main.path(forResource: title, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            backgroundMusicPlayer =  try AVAudioPlayer(contentsOf: url)
        } catch {
            // can't load file
        }
    }
}



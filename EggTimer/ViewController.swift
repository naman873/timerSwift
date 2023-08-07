//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
//
    
//    let softTime = 5;
//    let mediumTime = 7;
//    let hardTime = 12;
    
    var player:AVAudioPlayer = AVAudioPlayer()

    
    var timer = Timer()
    
    var time = 0;
    
    var timeProgress = 0;

    @IBOutlet var topText: UILabel!
    
    @IBOutlet var progressBar: UIProgressView!
    
    
    
    
    let dict = ["Soft" : 3, "Medium":4, "Hard" : 7]
    
    @IBAction func hardenessSelected(_ sender: UIButton) {
            
        let hardness = sender.currentTitle;
        

        
        if dict[hardness!] == 3 {
            print("soft")
            startTimer(stopWatchTime:dict[hardness!]!)
        }
        else if dict[hardness!] == 4 {
            print("medium")
            startTimer(stopWatchTime:dict[hardness!]!)

        }
        else {
            print("hard")
            startTimer(stopWatchTime:dict[hardness!]!)

          }
        
    }
    
    
    func startTimer(stopWatchTime: Int) {
        timer.invalidate()
        time = stopWatchTime
        timeProgress = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1 ,  target: self , selector: #selector(update) , userInfo: nil , repeats: true )
    }
    
    @objc func update(){
        
        progressBar.progress  = Float(timeProgress) / Float(time);
        
        
        timeProgress = timeProgress + 1;
        time = time - 1;
        if(time < 1){
            timer.invalidate()
            topText.text = "Done";
            playSound(named: "C")
        }
        
        
        print(time)
    }
 
    
    
    @discardableResult func playSound(named soundName: String) -> AVAudioPlayer {
        
        let audioPath = Bundle.main.path(forResource: soundName, ofType: "wav")
        player = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    
        player.play()
        
        return player
    }
    
}

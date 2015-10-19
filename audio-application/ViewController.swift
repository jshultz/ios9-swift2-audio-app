//
//  ViewController.swift
//  audio-application
//
//  Created by Jason Shultz on 10/19/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBAction func adjustVolume(sender: AnyObject) {
        player.volume = slider.value
    }
    
    
    @IBAction func playButton(sender: AnyObject) {
        
        player.play()
        
    }
    
    
    @IBAction func pauseButton(sender: AnyObject) {
        
        player.pause()
        
    }
    

    
    
    var player:AVAudioPlayer = AVAudioPlayer() // Create a player

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = NSBundle.mainBundle().pathForResource("mozart-k311-3-sasaki", ofType: "mp3")! // path to audio file
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
        } catch {
            print("siomething went wrong")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


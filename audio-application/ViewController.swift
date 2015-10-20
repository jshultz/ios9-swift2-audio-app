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
    
    @IBAction func pausebutton(sender: AnyObject) {
        player.pause()
    }
    

    @IBAction func stopButton(sender: AnyObject) {
        player.stop()
    }
    
    
    @IBOutlet weak var scrubberSlider: UISlider!
    
    
    @IBAction func scrubMusic(sender: AnyObject) {
        let playTime:NSTimeInterval = Double(self.scrubberSlider.value)
        player.currentTime = playTime
    }
    
    func updateScrubber() {
        scrubberSlider.value = Float(player.currentTime)
    }
    
    
    var player:AVAudioPlayer = AVAudioPlayer() // Create a player

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = NSBundle.mainBundle().pathForResource("mozart-k311-3-sasaki", ofType: "mp3")! // path to audio file
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            self.scrubberSlider.minimumValue = 0
            self.scrubberSlider.maximumValue = Float(self.player.duration)
            
            _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubber"), userInfo: nil, repeats: true)
            
        } catch {
            print("siomething went wrong")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  Music Instruments (Starter)
//
//  Created by Ben Alemu on 6/17/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var guitarSound: AVAudioPlayer?
    var trumpetSound: AVAudioPlayer?
    var tubaSound: AVAudioPlayer?
    var fluteSound: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playGuitar(_ sender: Any) {
        
        let path = Bundle.main.path(forResource: "guitar.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            guitarSound = try AVAudioPlayer(contentsOf: url)
            guitarSound?.play()
            
        } catch {
            print("Guitar failed to play")
        }
        
    }
    
    
    @IBAction func playTrumpet(_ sender: Any) {
        
        let path = Bundle.main.path(forResource: "trumpet.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            guitarSound = try AVAudioPlayer(contentsOf: url)
            guitarSound?.play()
            
        } catch {
            print("Guitar failed to play")
        }
        
        
    }
    
    @IBAction func playTuba(_ sender: Any) {
        
        let path = Bundle.main.path(forResource: "tuba.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            tubaSound = try AVAudioPlayer(contentsOf: url)
            tubaSound?.play()
            
        } catch {
            print("Tuba failed to play")
        }
    }
    
    
    @IBAction func playFlute(_ sender: Any) {
        
        let path = Bundle.main.path(forResource: "flute.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            fluteSound = try AVAudioPlayer(contentsOf: url)
            fluteSound?.play()
            
        } catch {
            print("Flute failed to play")
        }
    }
    
    

}


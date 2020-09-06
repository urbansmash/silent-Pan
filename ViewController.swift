//
//  ViewController.swift
//  urbanPan
//
//  Created by URBANSMASH pro on 29/08/2019.
//  Copyright © 2019 Play it on Pan. All rights reserved.
//

import UIKit
import AVFoundation
import AudioKit

var buttonArray: [UIButton] = [UIButton]()
var buttonDict: [Int: UIButton] = [:]

class ViewController: UIViewController {
    
    var document: UIDocument?
    
    @IBOutlet var button56: UIButton!
    @IBOutlet var button62: UIButton!
    @IBOutlet var button66: UIButton!
    @IBOutlet var button54: UIButton!
    @IBOutlet var button58: UIButton!
    @IBOutlet var button64: UIButton!
    @IBOutlet var button60: UIButton!
    @IBOutlet var button68: UIButton!
    @IBOutlet var button80: UIButton!
    @IBOutlet var button74: UIButton!
    @IBOutlet var button78: UIButton!
    @IBOutlet var button82: UIButton!
    @IBOutlet var button70: UIButton!
    @IBOutlet var button76: UIButton!
    @IBOutlet var button72: UIButton!
    @IBOutlet var button84: UIButton!
    @IBOutlet var button55: UIButton!
    @IBOutlet var button61: UIButton!
    @IBOutlet var button57: UIButton!
    @IBOutlet var button65: UIButton!
    @IBOutlet var button53: UIButton!
    @IBOutlet var button59: UIButton!
    @IBOutlet var button63: UIButton!
    @IBOutlet var button67: UIButton!
    @IBOutlet var button79: UIButton!
    @IBOutlet var button73: UIButton!
    @IBOutlet var button69: UIButton!
    @IBOutlet var button77: UIButton!
    @IBOutlet var button83: UIButton!
    @IBOutlet var button71: UIButton!
    @IBOutlet var button75: UIButton!
    @IBOutlet var button81: UIButton!
    
    var noteNum = 0
    
    var currentSound = 0
    
    var conductor = Conductor.shared

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        noteNum = 0
        
        currentSound = 0
        
        buttonArray = [self.button53, self.button54, self.button55, self.button56, self.button57, self.button58, self.button59, self.button60, self.button61,self.button62, self.button63, self.button64, self.button65, self.button66, self.button67, self.button68, self.button69, self.button70, self.button71, self.button72,self.button73, self.button74, self.button75, self.button76, self.button77, self.button78, self.button79, self.button80, self.button81, self.button82, self.button83, self.button84]
        
        for i in 53...84 {
            buttonDict[i] = buttonArray[i-53]
        }
        
        document?.open(completionHandler: { (success) in
            if success {
                self.conductor.importedMIDIURL = (self.document?.fileURL)!
                self.conductor.loadSamples(byIndex: self.currentSound)
                self.conductor.playSound()
            } else {
            }
        })
        
    }
    
    @IBAction func playNote(_ sender: UIButton) {
        conductor.sampler.play(noteNumber: MIDINoteNumber(sender.tag), velocity: 90)
    }
    
    @IBAction func stopNote(_ sender: UIButton) {
        conductor.sampler.stop(noteNumber: MIDINoteNumber(sender.tag))
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.conductor.midiFile.stop()
            self.document?.close(completionHandler: nil)
        }
    }
}

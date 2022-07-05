//
//  ViewController.swift
//  slider
//
//  Created by Валентин Коскин on 24.06.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var sliderBoard: UISlider!

    var player = AVAudioPlayer()
    let slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        //slider
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0
        self.slider.maximumValue = 100
        self.view.addSubview(slider)
        
        //add Target
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "patron", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error!")
        }
        self.player.play()
    }

    @objc func changeSlider (sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    //MARK: - Action
    @IBAction func playButton(_ sender: UIButton) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        self.player.pause()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        self.player.volume = self.sliderBoard.value
    }
    
    
}


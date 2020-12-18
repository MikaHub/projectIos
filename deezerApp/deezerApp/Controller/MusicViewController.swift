//
//  MusicViewController.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 18/12/2020.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
        override func viewDidLoad() {
            super.viewDidLoad()

            let sound = Bundle.main.path(forResource: "Coco", ofType: "mp3")

            do{
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.duckOthers])
            } catch {
                print(error)
            }
            // Do any additional setup after loading the view.
        }

        @IBAction func playButtonPressed( sender: Any) {
            audioPlayer.play()
        }
        @IBAction func pauseButtonPressed( sender: Any) {
            audioPlayer.pause()
        }

}

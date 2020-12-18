//
//  DetailViewController.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 15/12/2020.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = Bundle.main.path(forResource: "Solved", ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.duckOthers])
        } catch {
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        audioPlayer.play()
    }
    @IBAction func pauseButtonPressed(_ sender: Any) {
        audioPlayer.pause()
    }
}

//
//  Model.swift
//  ForMyLove
//
//  Created by Ivan Korsik on 11/6/18.
//  Copyright © 2018 Ivan Korsik. All rights reserved.
//

import AVFoundation

struct Music {
    
    var player: AVAudioPlayer?
    
    public mutating func playSound() {
        
        guard let url = Bundle.main.url(forResource: "Kostya", withExtension: "mov") else {
            print("url not found")
            return
        }
        
        do {
            
            try AVAudioSession.sharedInstance().setActive(true)
    
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            player?.numberOfLoops = -1
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }

    }
    
    public func setVolume(_ value: Float) {
        
        player?.volume = value
    }
    
}

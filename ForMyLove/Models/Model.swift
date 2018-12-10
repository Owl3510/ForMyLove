//
//  Model.swift
//  ForMyLove
//
//  Created by Ivan Korsik on 11/6/18.
//  Copyright © 2018 Ivan Korsik. All rights reserved.
//

import AVFoundation

struct Music {
    
    var player: AVPlayer?
    let onAir = URL(string: "http://stream.hoster.by:8081/pilotfm/pilot/icecast.audio")

    public mutating func playSound() {

        let playerItem = AVPlayerItem(url: onAir!)
        player = AVPlayer(playerItem: playerItem)
        player!.play()
    }
    
    public func setVolume(_ value: Float) {
        
        player?.volume = value
    }
    
}

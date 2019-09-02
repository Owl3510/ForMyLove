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
    let onAir = URL(string: "https://stream.hoster.by/unistar/unistar-128kb/icecast.audio?hash=1553450229417608")
    let onAir1 = URL(string: "http://stream.hoster.by:8081/pilotfm/pilot/icecast.audio")

    public mutating func createSound() {
        let playerItem = AVPlayerItem(url: onAir!)
        player = AVPlayer(playerItem: playerItem)
    }
    
    public mutating func playSound() {

        player!.play()
    }
    
    public func setVolume(_ value: Float) {
        
        player?.volume = value
    }
    
}

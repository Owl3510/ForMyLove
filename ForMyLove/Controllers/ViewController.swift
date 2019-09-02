//
//  ViewController.swift
//  ForFSC
//
//  Created by Ivan Korsik on 11/1/18.
//  Copyright © 2018 Ivan Korsik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    private var music = Music()
    private var playchoose = true
    private let images = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "6")!, UIImage(named: "4")!, UIImage(named: "5")!]
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
            
            imageView.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var touchBut: UIButton!
    @IBOutlet weak var musicVolume: UISlider!
    
    @IBAction func StartButton(_ sender: UIButton) {
        
        touchBut.isHidden = true
        display.text = "From L with KON'"
        imageView.startAnimating()
        musicVolume.isHidden = false
        music.playSound()
        UIView.animate(withDuration: 2, delay: 2, options: .curveEaseInOut, animations: {
            self.imageView.frame.origin.y += 150
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 4, options: .curveEaseInOut, animations: {
            self.imageView.frame.origin.y -= 150
        }, completion: nil)
    }
    
    @IBAction func setVolume(_ sender: UISlider) {
        music.setVolume(musicVolume.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
        imageView.animationImages = images
        imageView.animationDuration = 6
        music.createSound()
    }
    
    @objc private func handleTap( sender: UITapGestureRecognizer) {
        
        if playchoose {
            imageView.stopAnimating()
            music.player?.pause() //TODO
//            music.player?.stop()
            playchoose = false
        } else {
            imageView.startAnimating()
            music.player?.play()
            playchoose = true
        }
    }
    
    private func assignbackground(){
        let background = UIImage(named: "6082.png")
        
        let imageViews = UIImageView(frame: view.bounds)
        imageViews.contentMode =  UIView.ContentMode.bottom
        imageViews.clipsToBounds = true
        imageViews.image = background
        view.addSubview(imageViews)
        self.view.sendSubviewToBack(imageViews)
    }
}


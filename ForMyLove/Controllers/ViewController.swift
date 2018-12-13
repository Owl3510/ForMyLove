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
    private let images = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "must")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "7")!, UIImage(named: "8")!, UIImage(named: "9")!, UIImage(named: "kon")!, UIImage(named: "10")!, UIImage(named: "11")!]
    
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
        display.text = "From Love with KON'"
        imageView.startAnimating()
        musicVolume.isHidden = false
        music.playSound()
    }
    
    @IBAction func setVolume(_ sender: UISlider) {
        music.setVolume(musicVolume.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
        imageView.animationImages = images
        imageView.animationDuration = 6
        
        UIView.animate(withDuration: 3, delay: 2, options: .curveEaseOut, animations: {
            self.imageView.frame.origin.y += 150
        }, completion: nil)
        
        UIView.animate(withDuration: 3, delay: 1, options: .curveEaseOut, animations: {
            self.imageView.frame.origin.y -= 150
        }, completion: nil)
    }
    
    @objc private func handleTap( sender: UITapGestureRecognizer) {
        
        if playchoose {
            imageView.stopAnimating()
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


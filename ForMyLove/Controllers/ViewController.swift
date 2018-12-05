//
//  ViewController.swift
//  ForFSC
//
//  Created by Ivan Korsik on 11/1/18.
//  Copyright © 2018 Ivan Korsik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        assignbackground()
        imageView.animationImages = images
        imageView.animationDuration = 6
    }
    
    var music = Music()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var touchBut: UIButton!
    @IBOutlet weak var musicVolume: UISlider!
    
    let images = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "must")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "7")!, UIImage(named: "8")!, UIImage(named: "9")!, UIImage(named: "kon")!, UIImage(named: "10")!, UIImage(named: "11")!]
    
    @IBAction func StartButton(_ sender: Any) {
        
        touchBut.isHidden = true
        display.text = "From Love with KON'"
        imageView.startAnimating()
        musicVolume.isHidden = false
        music.playSound()
    }
    
    @IBAction func setVolume(_ sender: Any) {
        music.setVolume(musicVolume.value)
    }
    
    func assignbackground(){
        let background = UIImage(named: "6082.png")
        
        let imageViews = UIImageView(frame: view.bounds)
        imageViews.contentMode =  UIView.ContentMode.bottom
        imageViews.clipsToBounds = true
        imageViews.image = background
        view.addSubview(imageViews)
        self.view.sendSubviewToBack(imageViews)
    }
}


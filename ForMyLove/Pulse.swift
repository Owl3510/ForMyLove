//
//  Pulse.swift
//  ForMyLove
//
//  Created by Ivan Korsik on 12/14A/18.
//  Copyright © 2018 Ivan Korsik. All rights reserved.
//

import UIKit

class Pulse: CALayer {
    
    var groupAnimation = CAAnimationGroup()
    var radius: CGFloat = 200
    let intialPulser: Float = 0
    let nextPulseAfter: TimeInterval = 1
    var numberOfPulses: Float = Float.infinity
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(numberOfPulses: Float = Float.infinity, radius: CGFloat, position: CGPoint) {
        super.init()
        
        self.backgroundColor = UIColor.green.cgColor
        contentsScale = UIScreen.main.scale
        opacity = 0
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position
        
        bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        
        cornerRadius = radius
        
        DispatchQueue.global().async {
            
            self.setupGroup()
            
            DispatchQueue.main.async {
                
                self.add(self.groupAnimation, forKey: "pulse")
            }
        }
    }
    
    func pulseScaleAnimation() -> CABasicAnimation {
        let basicScaleAnimationObject = CABasicAnimation(keyPath: "transform.scale.xy")
        basicScaleAnimationObject.fromValue = NSNumber(value: intialPulser)
        basicScaleAnimationObject.toValue = NSNumber(value: 1)
        basicScaleAnimationObject.duration = 1
        
        return  basicScaleAnimationObject
    }
    
    func alphaToZeroAnimtion() ->
        CAKeyframeAnimation {
            
            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
            
            opacityAnimation.values = [0.4, 0.8, 1]
            opacityAnimation.keyTimes = [0, 0.2, 1]
            
            return opacityAnimation
    }
    
    func setupGroup() {
        
        groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 1 + nextPulseAfter
        groupAnimation.repeatCount = numberOfPulses
        
        let defaultCurve = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        groupAnimation.timingFunction = defaultCurve
        
        groupAnimation.animations = [pulseScaleAnimation(), alphaToZeroAnimtion()]
    }
    
    //    groupAnimation.animations = [pulseAnimation(), alphaToZeroAnimtion()]
    
}

//
//  CircularGradientProgressBarLayer.swift
//  CircularGradientProgressBar
//
//  Created by Darius Jankauskas on 24/08/2017.
//  Copyright © 2017 Darius Jankauskas. All rights reserved.
//

import UIKit

open class CircularGradientProgressBarLayer: ConicalGradientLayer {
    public func setupMask() {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.fillColor = UIColor.black.cgColor
        maskLayer.fillRule = kCAFillRuleEvenOdd
        
        let radius: CGFloat = bounds.size.width / 2
        let rect = CGRect(
            x: bounds.midX - radius,
            y: bounds.midY - radius,
            width: 2 * radius,
            height: 2 * radius)
        
        let radius2: CGFloat = 0.9 * radius
        let rect2 = CGRect(
            x: bounds.midX - radius2,
            y: bounds.midY - radius2,
            width: 2 * radius2,
            height: 2 * radius2)
        
        let path = UIBezierPath()
        path.append(UIBezierPath(ovalIn: rect))
        path.append(UIBezierPath(ovalIn: rect2))
        maskLayer.path = path.cgPath
        
        self.mask = maskLayer
    }
    
    public func rotate(to angle: CGFloat) {
        self.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
    }
}

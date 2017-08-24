//
//  CircularGradientProgressBarLayer.swift
//  CircularGradientProgressBar
//
//  Created by Darius Jankauskas on 24/08/2017.
//  Copyright © 2017 Darius Jankauskas. All rights reserved.
//

import UIKit

open class CircularGradientProgressBarLayer: ConicalGradientLayer {
    
    open var trackEndAngle: Double = Constants.MaxAngle {
        didSet {
            setNeedsDisplay()
        }
    }
    
    open var trackColor: UIColor = .lightGray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// can only be anabled when colors are specified
    open var stretch: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var gaps: (frequency: Int, gapSize: Int, drawSize: Int)? = (280, 3, 1) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// 1 - filled circle
    public var thickness: Double = 0.1 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public func rotate(to angle: CGFloat) {
        self.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
    }
    
    public override func draw(in rect: CGRect) {
        loadTransitions()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let shorterSide = Double(min(rect.width, rect.height))
        let endRadius = shorterSide / 2
        let startRadius = endRadius * (1 - thickness)
        let radiusToCoverEntireSquare = shorterSide * 2.squareRoot()
        let step = .pi/2 / radiusToCoverEntireSquare
        let stretchingMultiplier = stretch ? Constants.MaxAngle / endAngle : 1
        var angle = startAngle
        
        while angle <= trackEndAngle {
            
            if let gaps = gaps, Int(angle / Constants.MaxAngle * Double(gaps.frequency)) % (gaps.gapSize + gaps.drawSize) < gaps.gapSize {
                angle += step
                continue
            }
            
            let pointX = endRadius * cos(angle) + Double(center.x)
            let pointY = endRadius * sin(angle) + Double(center.y)
            let startPoint = CGPoint(x: pointX, y: pointY)
            let endPoint = CGPoint(x: startRadius * cos(angle) + Double(center.x),
                                   y: startRadius * sin(angle) + Double(center.y))
            
            let line = UIBezierPath()
            line.move(to: startPoint)
            line.addLine(to: endPoint)
            
            if angle > endAngle {
                trackColor.setStroke()
            } else {
                color(forAngle: angle * stretchingMultiplier).setStroke()
            }
            line.stroke()
            
            angle += step
        }
    }
}

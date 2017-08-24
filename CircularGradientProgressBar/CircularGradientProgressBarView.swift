//
//  CircularGradientProgressBarView.swift
//  CircularGradientProgressBar
//
//  Created by Darius Jankauskas on 24/08/2017.
//  Copyright © 2017 Darius Jankauskas. All rights reserved.
//

import UIKit

open class CircularGradientProgressBarView: UIView {
    open var gradient: CircularGradientProgressBarLayer { return layer as! CircularGradientProgressBarLayer }
    
    open override class var layerClass : AnyClass {
        return CircularGradientProgressBarLayer.self
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        
        layer.contentsScale = UIScreen.main.scale
        layer.drawsAsynchronously = true
        layer.needsDisplayOnBoundsChange = true
        layer.setNeedsDisplay()
    }
}

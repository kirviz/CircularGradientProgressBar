//
//  ViewController.swift
//  CircularGradientProgressBarDemo
//
//  Created by Darius Jankauskas on 24/08/2017.
//  Copyright © 2017 Darius Jankauskas. All rights reserved.
//

import UIKit
import CircularGradientProgressBar

class ViewController: UIViewController {

    var gradientView = CircularGradientProgressBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this is just to have something working -- proper demo is in the playground
        gradientView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        view.addSubview(gradientView)
        gradientView.gradient.rotate(to: 0.7 * .pi)
        gradientView.gradient.trackEndAngle = 1.59 * .pi
        gradientView.gradient.gaps = (frequency: 280, gapSize: 1, drawSize: 1)
        gradientView.gradient.stretch = true
        
        setupSlider()
    }
    
    func setupSlider() {
        let slider = UISlider(frame: CGRect(x: 50, y: 300, width: 200, height: 50))
        slider.minimumValue = 0
        slider.maximumValue = Float(gradientView.gradient.trackEndAngle)
        slider.isContinuous = true
        slider.value = .pi
        slider.addTarget(self, action: #selector(self.onSliderChange(sender:)), for: .valueChanged)
        view.addSubview(slider)
        
        self.onSliderChange(sender: slider)
    }
    
    func onSliderChange(sender: UISlider) {
        gradientView.gradient.endAngle = Double(sender.value)
    }
}

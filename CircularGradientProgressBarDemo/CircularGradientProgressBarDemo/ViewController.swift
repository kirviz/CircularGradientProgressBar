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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let progressView = CircularGradientProgressBarView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        view.addSubview(progressView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


import UIKit
import CircularGradientProgressBar
import PlaygroundSupport


let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
let view = CircularGradientProgressBarView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view.gradient.rotate(to: CGFloat(0.7 * M_PI))
//view.gradient.overloadAngle = 1.6 * M_PI

parentView.backgroundColor = .white
parentView.addSubview(view)


PlaygroundPage.current.liveView = parentView
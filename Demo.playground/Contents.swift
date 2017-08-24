import UIKit
import CircularGradientProgressBar
import PlaygroundSupport


let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 650))
parentView.backgroundColor = .white

let view1 = CircularGradientProgressBarView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
parentView.addSubview(view1)
view1.gradient.rotate(to: 0.7 * .pi)
view1.gradient.trackEndAngle = 1.59 * .pi
view1.gradient.gaps = (frequency: 280, gapSize: 2, drawSize: 1)
view1.gradient.stretch = true
view1.gradient.colors = [.red, .yellow, .green]

let view2 = CircularGradientProgressBarView(frame: CGRect(x: 0, y: 200, width: 200, height: 200))
parentView.addSubview(view2)
view2.gradient.rotate(to: 0.7 * .pi)
view2.gradient.trackEndAngle = 1.59 * .pi
view2.gradient.gaps = (frequency: 100, gapSize: 1, drawSize: 1)
view2.gradient.stretch = false

let view3 = CircularGradientProgressBarView(frame: CGRect(x: 0, y: 400, width: 200, height: 200))
parentView.addSubview(view3)
view3.gradient.gaps = nil
view3.gradient.thickness = 0.05
view3.gradient.trackColor = .clear
view3.gradient.stretch = false


// Slider
class Wrapper {
    @objc func onSliderChange(sender: UISlider) {
        let ratio = Double(sender.value)
        
        view1.gradient.endAngle = ratio * view1.gradient.trackEndAngle
        view2.gradient.endAngle = ratio * view2.gradient.trackEndAngle
        view3.gradient.endAngle = ratio * view3.gradient.trackEndAngle
    }
}

let wrapper = Wrapper()

let slider = UISlider(frame: CGRect(x: 0, y: 600, width: 200, height: 50))
slider.minimumValue = 0
slider.maximumValue = 1
slider.isContinuous = true
slider.value = 0.5
slider.addTarget(wrapper, action: #selector(Wrapper.onSliderChange(sender:)), for: .valueChanged)
parentView.addSubview(slider)

wrapper.onSliderChange(sender: slider)


// Preview
PlaygroundPage.current.liveView = parentView

//
//  ViewController.swift
//  AnimationTests
//
//  Created by Chris Conover on 2/2/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class AnimatedView: UIView {


//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        let frame = layer.presentation().frame el
//
//        super.point(inside: point, with: event)
//    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let defaultHitTest = super.hitTest(point, with: event)
        let inPresentation = layer.presentation()!.convert(point, from: layer)
        let hitTest = super.hitTest(inPresentation, with: event)
        print("\(point) -> \(inPresentation), in frame \(layer.presentation()!.frame), \(hitTest != nil) vs. \(defaultHitTest != nil)")
        return hitTest
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(gesture:)))
        pan.delegate = self
        red.addGestureRecognizer(pan)
        red.center = view.center
        view.addSubview(red)
    }

    lazy var red: UIView = {
        let red = AnimatedView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        red.backgroundColor = .red
        return red
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)

        var animation: UIViewPropertyAnimator?

        switch gesture.state {
        case .began:
            animation?.stopAnimation(true)
            gesture.setTranslation(.zero, in: self.view)
        case .changed:
            red.center += translation
            gesture.setTranslation(.zero, in: self.view)
        default:
            let panVelocity = gesture.velocity(in: view)
            let offset = red.center - view.center
            let animationVelocity = -panVelocity / offset
            let initialVelocity = -panVelocity.scalarProjection(offset) / offset.length

            print("Combined Initial velocity is: \(initialVelocity)")
//            UIView.animate(
//                withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5,
//                initialSpringVelocity: initialVelocity,
//                options: [.curveEaseInOut, .allowUserInteraction],
//                animations: { self.red.center = self.view.center },
//                completion: { _ in })


//            let timing = UISpringTimingParameters(dampingRatio: 0.4, initialVelocity: .from(animationVelocity))
//            animation = UIViewPropertyAnimator(duration: 1.0, timingParameters: timing)
//            animation?.addAnimations {
//                self.red.center = self.view.center
//                }
//            animation?.startAnimation()

                print("X velocity is: \(panVelocity.x / offset.x)")
                UIView.animate(
                    withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.5,
                    initialSpringVelocity: -panVelocity.x / offset.x,
                    options: [.curveEaseInOut, .allowUserInteraction],
                    animations: { self.red.center.x = self.view.center.x },
                    completion: { _ in })

                print("Y velocity is: \(panVelocity.y / offset.y)")
                UIView.animate(
                    withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.5,
                    initialSpringVelocity: -panVelocity.y / offset.y,
                    options: [.curveEaseInOut, .allowUserInteraction],
                    animations: { self.red.center.y = self.view.center.y },
                    completion: { _ in })
                break
            }
        print("translation: \(translation)")
    }
}

extension ViewController: UIGestureRecognizerDelegate {

}


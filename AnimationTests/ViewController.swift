//
//  ViewController.swift
//  AnimationTests
//
//  Created by Chris Conover on 2/2/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

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
        let red = UIView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        red.backgroundColor = .red
        return red
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)

        switch gesture.state {
        case .began:
            gesture.setTranslation(.zero, in: self.view)
        case .changed:
            red.center += translation
            gesture.setTranslation(.zero, in: self.view)
        default:
            let panVelocity = gesture.velocity(in: view)
            let offset = red.center - view.center
            let initialVelocity = -panVelocity.scalarProjection(offset) / offset.length

            print("Combined Initial velocity is: \(initialVelocity)")
//            UIView.animate(
//                withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5,
//                initialSpringVelocity: initialVelocity,
//                options: [.curveEaseInOut, .allowUserInteraction],
//                animations: { self.red.center = self.view.center },
//                completion: { _ in })

            print("X velocity is: \(panVelocity.x / offset.x)")
            UIView.animate(
                withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5,
                initialSpringVelocity: -panVelocity.x / offset.x,
                options: [.curveEaseInOut, .allowUserInteraction],
                animations: { self.red.center.x = self.view.center.x },
                completion: { _ in })

            print("Y velocity is: \(panVelocity.y / offset.y)")
            UIView.animate(
                withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5,
                initialSpringVelocity: -panVelocity.y / offset.y,
                options: [.curveEaseInOut, .allowUserInteraction],
                animations: { self.red.center.y = self.view.center.y },
                completion: { _ in })
            break
        }
//        print("translation: \(translation)")
    }
}

extension ViewController: UIGestureRecognizerDelegate {

}


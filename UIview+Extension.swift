//
//  UIview+Extension.swift
//  ProgressButon
//
//  Created by Abhijith on 06/09/20.
//  Copyright © 2020 Abhijith. All rights reserved.
//

import UIKit

extension UIView {
    func circleProgressAnimation(duration: TimeInterval,radius: CGFloat = 0) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = true
        
        let progressLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.height / 2.0) + radius, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        progressLayer.path = circularPath.cgPath
        progressLayer.name = "circleAnimation"
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 4.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(progressLayer)
        progressLayer.add(circularProgressAnimation, forKey: "progressAnimation")
    }
    
    func removeCircleProgressAnimation() {
        guard self.layer.sublayers!.count > 0 else {
            return
        }
        for layer in self.layer.sublayers! {
            if layer.name == "circleAnimation" {
                layer.removeFromSuperlayer()
            }
        }
    }
}


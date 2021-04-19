//
//  TestView.swift
//  EffectAnimatorDemo
//
//  Created by Woody Liu on 2021/4/15.
//

import UIKit
import EffectAnimator


class RhombusView: UIView {
    
    
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()!
        
        let rm = RhombusBuilder(center: .init(x: rect.width / 2, y: rect.height / 2), size: .init(width: 300, height: 300))
        UIColor.red.setStroke()

        ctx.setLineWidth(1)

        
        var points: [CGPoint] = []
        
        
        for i in 0...100 {
            points.append(rm.getPoint(CGFloat(i) / 100, rotate: .pi / 3))
        }
        
    ctx.addLines(between: points)

    
        
        
        
        ctx.strokePath()
        super.draw(rect)
    }
    
    
    
    
}

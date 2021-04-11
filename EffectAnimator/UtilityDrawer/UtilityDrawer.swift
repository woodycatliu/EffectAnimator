//
//  UtilityDrawer.swift
//  EffectAnimator
//
//  Created by Woody Liu on 2021/4/12.
//


/*
 繪圖類：
 提供各種形狀繪圖功能
 */

import UIKit


class UtilityDrawer {
    
    
    /// 繪製矩形
    /// - Parameters:
    ///   - lineWidth: 寬度，預設為 1。
    ///   - color: 預設 black
    ///   - alpha: 預設 1
    ///   - isStroke: 是否繪製線條
    ///   - isClip: 是否挖空矩形
    static func drawRect(_ ctx: CGContext, rect: CGRect, lineWidth: CGFloat = 1, color: UIColor = .black, alpha: CGFloat = 1, isStroke: Bool, isClip: Bool = false) {
        let path = UIBezierPath(rect: rect)
        path.lineWidth = lineWidth
        
        ctx.addPath(path.cgPath)
        
        ctx.setAlpha(alpha)
        
        if isClip {
            ctx.clip()
            return
        }
        
        if isStroke {
            color.setStroke()
            ctx.strokePath()
            return
        }
        color.setFill()
        ctx.fillPath()
    }
    
    
    ///  繪製橢圓形
    /// - Parameters:
    ///   - rect: 傳入正方形，則繪製正圓形
    ///   - lineWidth: 預設 1
    ///   - color: 預設黑色
    ///   - alpha: 預設1
    ///   - isClip: 預設 false
    static func drawOval(_ ctx: CGContext, rect: CGRect, lineWidth: CGFloat = 1, color: UIColor = .black, alpha: CGFloat = 1, isStroke: Bool, isClip: Bool = false) {
        let path = UIBezierPath(ovalIn: rect)
        path.lineWidth = lineWidth
        
        ctx.addPath(path.cgPath)
        
        ctx.setAlpha(alpha)
        
        
        if isClip {
            ctx.clip()
            return
        }
        
        if isStroke {
            color.setStroke()
            ctx.strokePath()
            return
        }
        
        color.setFill()
        ctx.fillPath()
    }
    
    
    
//    static func drawLines(_ ctx: CGContext, origin: CGPoint, pathPoint: [CGPoint], lineWidth: CGFloat = 1, color: UIColor = .black, alpha: CGFloat = 1, isStroke: Bool, isClip: Bool = false) {
//        let path = UIBezierPath()
//        path.move(to: origin)
//        path.lineWidth = lineWidth
//    
//        
//        
//        
//        
//        
//    }
//    
    
    
}




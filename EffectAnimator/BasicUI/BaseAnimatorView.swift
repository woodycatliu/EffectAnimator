//
//  BaseAnimatorView.swift
//  EffectAnimator
//
//  Created by Woody on 2021/4/6.
//

import UIKit


open class EABasicView: UIView, BasicAnimator {
    
    public var displayLink: CADisplayLink?
    
    public var beginTime: CFTimeInterval?
    
    public var lastUpdateTime: CFTimeInterval = 0
    /// 動畫持續時間
    public var duration: Double = .greatestFiniteMagnitude
    
    /// 動畫每一幀時間間隔
    public var interval: Double = 1 / 60
    /// 實際時間間隔
    public var _interval: Double = 0
    
    public var delegate: AnyObject?
    
    public var animatorRenderers: [BaseRenderer] = []
        
    @objc public func update() {
        guard let beginTime = beginTime else { return }
        
        let currentTime = CACurrentMediaTime()
        
        if beginTime + duration <= currentTime {
            displayLink?.isPaused = true
            displayLink?.invalidate()
            self.beginTime = nil
            lastUpdateTime = 0
            return
        }
        
        if lastUpdateTime == 0 && currentTime - beginTime >= interval || currentTime - lastUpdateTime >= interval {
            _interval = lastUpdateTime == 0 ? currentTime - beginTime : currentTime - lastUpdateTime
            lastUpdateTime = currentTime
            setNeedsDisplay()
//            layer.setNeedsDisplay()
        }
        
    }
    
    
}


extension EABasicView {
    
    public func setup() {
        displayLink?.invalidate()
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink?.isPaused = true
        displayLink?.add(to: .main, forMode: .common)
    }
    
}

// MARK: override draw
extension EABasicView {
    open override func draw(_ rect: CGRect) {
        guard var ctx = UIGraphicsGetCurrentContext() else {
            super.draw(rect)
            return
        }
        
        for renderer in animatorRenderers {
            ctx = renderer.draw(in: ctx, rect, timeInterval: _interval)
        }
        super.draw(rect)
    }
}



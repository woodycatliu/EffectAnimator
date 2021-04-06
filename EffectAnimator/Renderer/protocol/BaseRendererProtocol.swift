//
//  BaseRenderer.swift
//  EffectAnimator
//
//  Created by Woody Liu on 2021/4/4.
//

import UIKit


public protocol BaseRendererProtocol: class {
    /// 一次動畫生命週期所需時間
    var duration: Double { get set }
    /// 動畫已執行時間
    var launchedTimeInterval: CFTimeInterval { get set }
    
    var repeatCount: Double { get set }
    
    func draw(in ctx: CGContext, _ rect: CGRect, timeInterval: CFTimeInterval)-> CGContext
    
    func _draw(in ctx: CGContext, _ rect: CGRect, percent: CGFloat)-> CGContext
    
    func timeToPercent()-> CGFloat
    
}


extension BaseRendererProtocol {
    
    public func draw(in ctx: CGContext, _ rect: CGRect, timeInterval: CFTimeInterval)-> CGContext {
        self.launchedTimeInterval += timeInterval
        let precent = timeToPercent()
        return _draw(in: ctx, rect, percent: precent)
    }
    
    public func timeToPercent()-> CGFloat {
        
        guard duration > 0 else { return 0.0 }
        
        let timestamp = launchedTimeInterval / duration
        
        guard timestamp < repeatCount else {
            return 1.0
        }
        return CGFloat(timestamp - Double.getInteger(timestamp))
    }
}


open class BaseRenderer: BaseRendererProtocol {
    
    open var duration: Double
    
    open var launchedTimeInterval: CFTimeInterval = 0
    
    /// 預設無限
    open var repeatCount: Double = .greatestFiniteMagnitude
    
    open func _draw(in ctx: CGContext, _ rect: CGRect, percent: CGFloat) -> CGContext {
        return ctx
    }
    
    public init(duration: Double) {
        self.duration = duration
    }
    
}

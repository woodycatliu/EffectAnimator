//
//  BasicAnimate.swift
//  EffectAnimator
//
//  Created by Woody on 2021/1/4.
//

/*
 2021-04-04
 修改方向~
 basicAnimate
 - 分離繪圖。
 - 功能：時間管理
 1. currectDate()
 2. displayLinkSelector -> 改名 update
 3. 思考 移除 by value, fromValue, byValue 由 Render 擔任
 4. 時間控管 改為 currectTime ， update 紀錄 上一次displayLink currectTime
 5. 每 0.1 秒呼叫 draw
 6. timeSpace 可控
 */


import UIKit


public protocol BasicAnimator: class {
    /// 控制器
    var displayLink: CADisplayLink? { get set }
    
    var beginTime: CFTimeInterval? { get set }
    
    var lastUpdateTime: CFTimeInterval { get set }
    /// 動畫持續時間
    var duration: Double { get set }
    
    /// 時間間隔
    /// 動畫每一幀實際時間間隔
    /// 預設 1 / 60 秒
    var interval: Double { get set }
    
    var _interval: Double { get set }
    
    
    var animatorRenderers: [BaseRenderer] { get set }
    
    var isAnimating: Bool { get }
    
    /// touch delegate 傳出
    var delegate: AnyObject? { get set }
    
    /// displayLink 每一幀調用更新
    func update()
    
    func startAnimate()
    
    func stopAnimate()
    
    func restartAnimate()
    
    func setup()
    
    init(duration: Double, renderers: [BaseRenderer], frame: CGRect)
    
    init(renderers: [BaseRenderer])
}

extension BasicAnimator where Self: UIView {
    
   public func startAnimate() {
        if beginTime != nil {
            return
        }
        beginTime = CACurrentMediaTime()
        lastUpdateTime = 0
        displayLink?.isPaused = false
    }
    
    public func stopAnimate() {
        displayLink?.isPaused = true
        lastUpdateTime = CACurrentMediaTime()
    }
    
    public func restartAnimate() {
        displayLink?.isPaused = false
    }
    
    public var isAnimating: Bool {
        return displayLink?.isPaused ?? false
    }
    
    public init(duration: Double = .greatestFiniteMagnitude, renderers: [BaseRenderer], frame: CGRect) {
        self.init(frame: frame)
        self.duration = duration
        self.animatorRenderers = renderers
    }
    
    public init(renderers: [BaseRenderer]) {
        self.init(renderers: renderers, frame: .zero)
    }
}





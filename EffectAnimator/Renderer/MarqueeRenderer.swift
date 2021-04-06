//
//  MarqueeRenderer.swift
//  EffectAnimator
//
//  Created by Woody on 2021/4/6.
//

import UIKit

open class MqrqueeRenderer: BaseRenderer {
    
    public var text: String?
    
    public var textColor: UIColor = .black
    
    public var textFont: UIFont = .systemFont(ofSize: 15)
    
    public var direction: DirectionType = .right
    
    public override func _draw(in ctx: CGContext, _ rect: CGRect, percent: CGFloat) -> CGContext {
        drawText(in: ctx, rect, percent: percent)
        return ctx
    }
    
    
    
    func drawText(in ctx: CGContext, _ rect: CGRect, percent: CGFloat) {
        
        guard let text = text else {
            Logger.log(message: "text is nil")
            return }
        let textRect = text.bounds(textFont)
        // 畫板寬度
        let ctxWidth: CGFloat = rect.width
        // 畫板高度
        let ctxHeight: CGFloat = rect.height
        // 字串寬度
        let textWidth = textRect.width
        // 字串高度
        let texHeight = textRect.height
        // 整個path 的寬度
        let pathWidth = ctxWidth + textWidth
        
        let x: CGFloat
        
        if direction == .right {
            x = ctxWidth - pathWidth * sin(percent * .pi / 2)
        } else {
            x = ctxWidth - pathWidth * cos(percent * .pi / 2)
        }
        
        let y = ctxHeight - texHeight <= 0 ? 0 : (ctxHeight - texHeight) / 2
        
        UIGraphicsPushContext(ctx)
        
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: textColor, .font: textFont]
        let stringAttribute = NSAttributedString(string: self.text ?? "", attributes: attributes)
        stringAttribute.draw(at: CGPoint(x: x, y: y))
        
        UIGraphicsPopContext()
    }
    
}

extension MqrqueeRenderer {
    public enum DirectionType {
        /// begin at left
        case left
        /// begin at right
        case right
    }
}

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
    
    
    public override func _draw(in ctx: CGContext, _ rect: CGRect, percent: CGFloat) -> CGContext {
        drawText(in: ctx, rect, percent: percent)
        return ctx
    }
    
    
    
    func drawText(in ctx: CGContext, _ rect: CGRect, percent: CGFloat) {
      
        guard let text = text else {
            Logger.log(message: "text is nil")
            return }
        let textRect = self.getTextRect(text)
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
        print(percent)
        print("cos:", sin(percent))
        let x = ctxWidth - pathWidth * cos(percent * .pi / 2)
        
        let y = ctxHeight - texHeight <= 0 ? 0 : (ctxHeight - texHeight) / 2
        
        UIGraphicsPushContext(ctx)
        
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: textColor, .font: textFont]
        let stringAttribute = NSAttributedString(string: self.text ?? "", attributes: attributes)
        stringAttribute.draw(at: CGPoint(x: x, y: y))

        UIGraphicsPopContext()
    }
    
    
    func getTextRect(_ text: String)-> CGRect {
        NSString(string: text).boundingRect(with: .zero, options: .usesFontLeading, attributes: [.font: textFont, .foregroundColor: textColor], context: nil)
    }
    
}

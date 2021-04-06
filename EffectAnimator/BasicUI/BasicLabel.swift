//
//  BasicLabel.swift
//  EffectAnimator
//
//  Created by Woody on 2021/1/5.
//

import Foundation
import UIKit

//class BasicLabel: UIView, BasicLabelProtocol, BasicAnimator {
//
//    var text: String?
//    
//    var textColor: UIColor = .black
//    
//    var font: UIFont = UIFont.systemFont(ofSize: 15)
//    
//    var textSize: CGRect = .zero
//    
//    var textAlignment: NSTextAlignment = .right
//    
//    var valueAdaptor: CGFloat = 0.0
//    
//    var duration: CGFloat = 5
//    
//    internal lazy var displayLink: CADisplayLink = {
//        let link = CADisplayLink(target: delegate ?? self, selector: #selector(update))
//        link.isPaused = false
//        return link
//    }()
//    
//    weak var delegate: AnyObject?
//    
//    var currectValue: CGFloat = 0
//    
//    var currectByValue: CGFloat {
//        if byValue == nil {
//            return  (toValue - fromValue) / duration / 60 / valueAdaptor
//        } else {
//            return byValue!
//        }
//    }
//    
//    var fromValue: CGFloat = 0 {
//        willSet {
//            currectValue = newValue
//        }
//    }
//    
//    var toValue: CGFloat = 0
//    
//    var byValue: CGFloat?
//    
//    func startAnimate() {
//        
//    }
//    
//    @objc func update() {
//    
//    }
//    
//    func textWidthAdapte() {
//        
//    }
//    
//}
//

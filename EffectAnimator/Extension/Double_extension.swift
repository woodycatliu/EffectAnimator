//
//  Double_extension.swift
//  EffectAnimator
//
//  Created by Woody on 2021/4/6.
//

import Foundation
import UIKit

extension Double {
    static func getDecimal(_ dividend: Double, _ divisor: Double)-> Double {
        return dividend / divisor - Double(Int(dividend / divisor))
    }
    
    static func getInteger(_ value: Double)-> Double {
        return Double(Int(value))
    }
    
    var percentage: Double {
        return self - Double(Int(self))
    }
    
    func rounding(to position: Int)-> Double {
        var origin = Decimal(self)
        var willRound = Decimal()
        NSDecimalRound(&willRound, &origin, position, .plain)
        return NSDecimalNumber(decimal: willRound).doubleValue
    }
    
    func string()-> String {
        return NSDecimalNumber(decimal: Decimal(self)).stringValue
    }
}


extension CGFloat {
    static func getDecimal(_ dividend: CGFloat, _ divisor: CGFloat)-> CGFloat {
        return dividend / divisor - CGFloat(Int(dividend / divisor))
    }
    
    static func getInteger(_ value: CGFloat)-> CGFloat {
        return CGFloat(Int(value))
    }
    
    var percentage: CGFloat {
        return self - CGFloat(Int(self))
    }
    
    func rounding(to position: Int)-> CGFloat {
        var origin = Decimal(self)
        var willRound = Decimal()
        NSDecimalRound(&willRound, &origin, position, .plain)
        return CGFloat(NSDecimalNumber(decimal: willRound).floatValue)
    }
    
    func string()-> String {
        return NSDecimalNumber(decimal: Decimal(self)).stringValue
    }
}

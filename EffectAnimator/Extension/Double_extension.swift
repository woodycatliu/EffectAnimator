//
//  Double_extension.swift
//  EffectAnimator
//
//  Created by Woody on 2021/4/6.
//

import Foundation

extension Double {
    static func getDecimal(_ dividend: Double, _ divisor: Double)-> Double {
        return dividend / divisor - Double(Int(dividend / divisor))
    }
    
    static func getInteger(_ value: Double)-> Double {
        return Double(Int(value))
    }
}

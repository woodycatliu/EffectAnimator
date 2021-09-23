//
//   CGContext.swift
//  EffectAnimator
//
//  Created by Woody Liu on 2021/8/19.
//

import UIKit

extension CGContext {
    
    func resetTransform(_ originCTM: CGAffineTransform) {
        let trans = ctm.inverted()
        self.concatenate(trans)
        self.concatenate(originCTM)
    }
}

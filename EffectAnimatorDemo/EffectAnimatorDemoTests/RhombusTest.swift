//
//   RhombusTest.swift
//  EffectAnimatorTests
//
//  Created by Woody Liu on 2021/4/15.
//

import XCTest
@testable import EffectAnimator

class RhombusTest: XCTestCase {
    let rhombusFirst: RhombusBuilder = RhombusBuilder(center: .init(x: 5, y: 5), size: .init(width: 10, height: 10))
     
    let rhombusSecond: RhombusBuilder = RhombusBuilder(center: .init(x: -5, y: -5), size: .init(width: 10, height: 10))
    
    let rhombusThree: RhombusBuilder = RhombusBuilder(origin: .zero, size: .init(width: 10, height: 10))
    
    let rhombusFour: RhombusBuilder = RhombusBuilder(origin: .init(x: -10, y: -10), size: .init(width: 10, height: 10))
    
    
    func test_init() {
        
        XCTAssertEqual(rhombusFirst.origin, CGPoint(x: 0, y: 0))
        
        XCTAssertEqual(rhombusSecond.origin, CGPoint(x: -10, y: -10))
        
        XCTAssertEqual(rhombusThree.center, CGPoint(x: 5, y: 5))

        XCTAssertEqual(rhombusFour.center, CGPoint(x: -5, y: -5))

    }
    
    func test_getPoint() {
        
        XCTAssertEqual(rhombusFirst.getPoint(0, rotate: 1), CGPoint(x: 0, y: 5))
        
        XCTAssertEqual(rhombusFirst.getPoint(1, rotate: 1), CGPoint(x: 0, y: 5))
        
        XCTAssertEqual(rhombusFirst.getPoint(-0.75, rotate: 1), CGPoint(x: 5, y: 0))

        
    }
    
    
    
    
    
}

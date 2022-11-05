//
//  AppleAppearenceStrategy.swift
//  SnakeGame
//
//  Created by admin on 05.11.2022.
//

import Foundation

protocol AppleAppearenceStrategy: AnyObject {
    func createApple(in rect: CGRect) -> [Apple]
}

class RandomAppleAppearenceStrategy: AppleAppearenceStrategy {
    func createApple(in rect: CGRect) -> [Apple] {
        let randX  = CGFloat(arc4random_uniform(UInt32(rect.maxX - 5)) + 1)
        let randY  = CGFloat(arc4random_uniform(UInt32(rect.maxY - 5)) + 1)
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        return [apple]
    }
}

class FixedAppleAppearenceStrategy: AppleAppearenceStrategy {
    private let positions = [
        CGPoint(x: 210, y: 210),
        CGPoint(x: 250, y: 250),
        CGPoint(x: 150, y: 250),
        CGPoint(x: 250, y: 300),
        CGPoint(x: 210, y: 210),
        CGPoint(x: 200, y: 210),
        CGPoint(x: 200, y: 250),
        CGPoint(x: 100, y: 200),
        CGPoint(x: 150, y: 300),
        CGPoint(x: 150, y: 250),
    ]
    
    private var lastUsedPosition = -1
    
    func createApple(in rect: CGRect) -> [Apple] {
        lastUsedPosition += 1
        if lastUsedPosition >= positions.count {
            lastUsedPosition = 0
        }
        let position = positions[lastUsedPosition]
        let apple = Apple(position: position)
        return [apple]
    }
}

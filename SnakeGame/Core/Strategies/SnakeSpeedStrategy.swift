//
//  SnakeSpeedStrategy.swift
//  SnakeGame
//
//  Created by admin on 05.11.2022.
//

import Foundation

protocol SnakeSpeedStrategy: AnyObject {
    var maxSpeed: Double? { get set }
    
    func increaseSnakeSpeed(snake: Snake)
}

class FixedSnakeSpeedStrategy: SnakeSpeedStrategy {
    var maxSpeed: Double?
    
    func increaseSnakeSpeed(snake: Snake) {}
}

class ArythmeticProgressionSnakeSpeedStrategy: SnakeSpeedStrategy {
    var maxSpeed: Double?
    
    private let speedIncrease: Double = 5
    
    func increaseSnakeSpeed(snake: Snake) {
        snake.moveSpeed.value += speedIncrease
        
        if let maxSpeed = maxSpeed {
            if snake.moveSpeed.value > maxSpeed {
                snake.moveSpeed.value = maxSpeed
            }
        }
    }
}

class GeometricProgressionSnakeSpeedStrategy: SnakeSpeedStrategy {
    var maxSpeed: Double?
    
    private let speedMultiplier: Double = 1.1
    
    func increaseSnakeSpeed(snake: Snake) {
        snake.moveSpeed.value *= speedMultiplier
        
        if let maxSpeed = maxSpeed {
            if snake.moveSpeed.value > maxSpeed {
                snake.moveSpeed.value = maxSpeed
            }
        }
    }
}

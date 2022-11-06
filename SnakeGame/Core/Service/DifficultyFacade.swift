//
//  DifficultyFacade.swift
//  SnakeGame
//
//  Created by admin on 06.11.2022.
//

import Foundation

class DifficultyFacade {
    var difficulty: Difficulty = .normal
    
    private var appleAppearenceStrategy: AppleAppearenceStrategy
    private var snakeSpeedStrategy: SnakeSpeedStrategy
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        
        switch difficulty {
        case .easy:
            appleAppearenceStrategy = FixedAppleAppearenceStrategy()
        case .normal, .hard, .insane:
            appleAppearenceStrategy = RandomAppleAppearenceStrategy()
        }
        
        switch difficulty {
        case .easy, .normal:
            snakeSpeedStrategy = FixedSnakeSpeedStrategy()
        case .hard:
            snakeSpeedStrategy = ArythmeticProgressionSnakeSpeedStrategy()
        case .insane:
            snakeSpeedStrategy = GeometricProgressionSnakeSpeedStrategy()
        }
    }
    
    func createApple(in rect: CGRect) -> [Apple] {
        return appleAppearenceStrategy.createApple(in: rect)
    }
    
    func increaseSnakeSpeed(snake: Snake) {
        snakeSpeedStrategy.increaseSnakeSpeed(snake: snake)
    }
}

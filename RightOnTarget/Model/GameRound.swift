//
//  GameRound.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 21.09.2024.
//

protocol GameRoundProtocol {
    
    var score: Int { get }
    var secretValue: Int! { get }
    
    func calculateScore(with: Int)
}

class GameRound: GameRoundProtocol {
    
    var score: Int = 0
    var secretValue: Int!
    
    init(secretValue: Int!) {
        self.secretValue = secretValue
    }
    
    func calculateScore(with value: Int) {
        if value > secretValue {
            score += 50 - value + secretValue
        } else if value < secretValue {
            score += 50 - secretValue + value
        } else {
            score += 50
        }
    }
}

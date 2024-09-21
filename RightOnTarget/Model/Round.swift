//
//  GameRound.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 21.09.2024.
//

import UIKit

protocol Round {
    
    associatedtype Value
    
    var score: Int { get }
    var secretValue: Value { get }
    
    func calculateScore(with: Int)
}

// MARK: NumbersGameRound

class NumbersGameRound: Round {
    
    var score: Int = 0
    var secretValue: Int
    
    init() {
        self.secretValue = NumberGenerator.getRandomValue()
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

// MARK: ColorsGameRound

class ColorsGameRound: Round {
    
    var score: Int = 0
    var secretValue: UIColor
    
    init() {
        self.secretValue = ColorGenerator.getRandomValue()
    }
    
    func calculateScore(with value: Int) {
        score += 1
    }
}

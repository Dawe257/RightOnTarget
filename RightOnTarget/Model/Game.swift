//
//  Game.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 20.09.2024.
//

protocol GameProtocol {
    
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    
    var score: Int = 0
    private var minSecretValue: Int
    private var maxSecretValue: Int
    var currentSecretValue: Int = 0
    private var lastRound: Int
    private var currentRound: Int = 1
    var isGameEnded: Bool { currentRound >= lastRound }
    
    init?(minSecretValue: Int, maxSecretValue: Int, rounds: Int) {
        guard minSecretValue < maxSecretValue else { return nil }
        self.minSecretValue = minSecretValue
        self.maxSecretValue = maxSecretValue
        lastRound = rounds
        currentSecretValue = getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = getNewSecretValue()
        currentRound += 1
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
    
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
}

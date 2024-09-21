//
//  Game.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 20.09.2024.
//

import UIKit

protocol Game {
    
    associatedtype Round
    
    var score: Int { get }
    var currentRound: Round { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
}

// MARK: NumbersGame

class NumbersGame: Game {
    
    private var roundsCount: Int
    private var rounds: [NumbersGameRound]
    var currentRound: NumbersGameRound
    var score: Int { rounds.reduce(0) { $0 + $1.score } }
    var isGameEnded: Bool { rounds.count >= roundsCount }
    
    init(rounds: Int) {
        self.currentRound = NumbersGameRound()
        self.rounds = [self.currentRound]
        roundsCount = rounds
    }
    
    func restartGame() {
        rounds.removeAll()
        startNewRound()
    }
    
    func startNewRound() {
        currentRound = NumbersGameRound()
        rounds.append(currentRound)
    }
}

// MARK: ColorsGame

class ColorsGame: Game {
    
    private var roundsCount: Int
    private var rounds: [ColorsGameRound]
    var currentRound: ColorsGameRound
    var score: Int { rounds.reduce(0) { $0 + $1.score } }
    var isGameEnded: Bool { rounds.count >= roundsCount }
    
    init(rounds: Int) {
        self.currentRound = ColorsGameRound()
        self.rounds = [self.currentRound]
        roundsCount = rounds
    }
    
    func getRandomColor() -> UIColor {
        ColorGenerator.getRandomValue()
    }
    
    func restartGame() {
        rounds.removeAll()
        startNewRound()
    }
    
    func startNewRound() {
        currentRound = ColorsGameRound()
        rounds.append(currentRound)
    }
}

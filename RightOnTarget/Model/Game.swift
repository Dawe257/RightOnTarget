//
//  Game.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 20.09.2024.
//

protocol GameProtocol {
    
    var score: Int { get }
    var secretValueGenerator: GeneratorProtocol { get }
    var currentRound: GameRoundProtocol { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
}

class Game: GameProtocol {
    
    private var roundsCount: Int
    private var rounds: [GameRoundProtocol]
    let secretValueGenerator: GeneratorProtocol
    var currentRound: GameRoundProtocol
    var score: Int { rounds.reduce(0) { $0 + $1.score } }
    var isGameEnded: Bool { rounds.count >= roundsCount }
    
    init(minSecretValue: Int, maxSecretValue: Int, rounds: Int) {
        secretValueGenerator = Generator(minSecretValue: 1, maxSecretValue: 50)!
        currentRound = GameRound(secretValue: secretValueGenerator.getRandomNumber())
        self.rounds = [currentRound]
        roundsCount = rounds
    }
    
    func restartGame() {
        rounds.removeAll()
        startNewRound()
    }
    
    func startNewRound() {
        currentRound = GameRound(secretValue: secretValueGenerator.getRandomNumber())
        rounds.append( currentRound )
    }
}

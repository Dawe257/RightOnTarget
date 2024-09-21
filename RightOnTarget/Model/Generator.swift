//
//  Generator.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 21.09.2024.
//

protocol GeneratorProtocol {
    
    func getRandomNumber() -> Int
}

class Generator : GeneratorProtocol {
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    init?(minSecretValue: Int, maxSecretValue: Int) {
        guard minSecretValue < maxSecretValue else { return nil }
        self.minSecretValue = minSecretValue
        self.maxSecretValue = maxSecretValue
    }
    
    func getRandomNumber() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
}

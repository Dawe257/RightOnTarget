//
//  Generator.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 21.09.2024.
//
import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }
    
    func toHex() -> String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return nil }
        let r = Int(red * 255)
        let g = Int(green * 255)
        let b = Int(blue * 255)
        return String(format: "#%02X%02X%02X", r, g, b)
    }
}


protocol Generator {
    
    associatedtype Value
    
    static func getRandomValue() -> Value
}

// MARK: NumberGenerator

class NumberGenerator : Generator {
    
    private static let minSecretValue = 1
    private static let maxSecretValue = 50
    
    static func getRandomValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
}

// MARK: ColorGenerator

class ColorGenerator: Generator {
    
    static func getRandomValue() -> UIColor {
        return .random()
    }
}

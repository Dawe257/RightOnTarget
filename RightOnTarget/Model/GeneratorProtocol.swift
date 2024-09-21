//
//  GeneratorProtocol.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 21.09.2024.
//

import UIKit

protocol ColorGeneratorProtocol {
    
    func getRandomColor() -> UIColor
}

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
        
        // Получаем значения RGB и альфа-компонента
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
        
        // Преобразуем компоненты в формат 0–255
        let r = Int(red * 255)
        let g = Int(green * 255)
        let b = Int(blue * 255)
        
        // Формируем hex-строку
        return String(format: "#%02X%02X%02X", r, g, b)
    }
}

class ColorGenerator: ColorGeneratorProtocol {
    
    func getRandomColor() -> UIColor {
        return .random()
    }
}

//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 19.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var game: Game!

    // Элементы на сцене
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        game = Game(minSecretValue: 1, maxSecretValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    // MARK: - Взаимодействие View - Model
    
    // Проверка выбранного пользователем числа
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(self.slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    private func updateLabelWithSecretNumber(newText: String) {
        self.label.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
        self.present(alert, animated: true)
    }
}

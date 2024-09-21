//
//  ColorsViewController.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 21.09.2024.
//

import UIKit

class ColorsViewController: UIViewController {
    
    private var game: ColorsGame!

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    private var answers: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = ColorsGame(rounds: 5)
        updateLabelWithSecretHex(newHex: game.currentRound.secretValue.toHex()!)
        answers = [answer1, answer2, answer3, answer4]
        fillButtons(answer: game.currentRound.secretValue)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func checkAnswer(_ button: UIButton) {
        if button.backgroundColor == game.currentRound.secretValue {
            game.currentRound.calculateScore(with: 1)
        }
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretHex(newHex: game.currentRound.secretValue.toHex()!)
        fillButtons(answer: game.currentRound.secretValue)
    }
    
    func fillButtons(answer: UIColor) {
        answers.forEach { $0.backgroundColor = game.getRandomColor() }
        answers.randomElement()!.backgroundColor = answer
    }
    
    func updateLabelWithSecretHex(newHex: String) {
        self.questionLabel.text = newHex
    }
    

    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
        self.present(alert, animated: true)
    }

    @IBAction func toStartScreen() {
        dismiss(animated: true)
    }
}

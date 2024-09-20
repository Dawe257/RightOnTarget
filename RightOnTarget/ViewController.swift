//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Давид Женетль on 19.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var randomNumber = 0
    var round = 1
    var points = 0

    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
        self.randomNumber = Int.random(in: 1...50)
        self.label.text = "\(randomNumber)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    @IBAction func check() {
        let numSlider = Int(self.slider.value.rounded())
        var result = 0
        if numSlider > self.randomNumber {
            result += 50 - numSlider + self.randomNumber
        } else if numSlider < self.randomNumber {
            result += 50 - self.randomNumber + numSlider
        } else {
            result += 50
        }
        self.points += result
        self.totalScore.text = "Счет: \(self.points)"
        if self.round == 5 {
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Заработано очков: \(self.points)",
                preferredStyle: .alert
            )
            let alertAction = UIAlertAction(
                title: "Начать заново",
                style: .default,
                handler: { _ in self.totalScore.text = "Счет: 0" }
            )
            alert.addAction(alertAction)
            present(alert, animated: true)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        self.randomNumber = Int.random(in: 1...50)
        self.label.text = "\(randomNumber)"
    }
}

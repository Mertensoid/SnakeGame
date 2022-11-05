//
//  StartViewController.swift
//  SnakeGame
//
//  Created by admin on 04.11.2022.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    @IBOutlet weak var lastRecordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "StartGameSegue":
            guard let destination = segue.destination as? GameViewController else {
                return
            }
            destination.delegate = self
            switch difficultyControl.selectedSegmentIndex {
            case 0:
                destination.difficulty = .easy
            case 1:
                destination.difficulty = .normal
            case 2:
                destination.difficulty = .hard
            case 3:
                destination.difficulty = .insane
            default:
                destination.difficulty = .normal
            }
        default:
            return
        }
    }
}

extension StartViewController: GameDelegate {
    func gameEnded(withResult result: Int) {
        Records.shared.addRecord(name: "Макс", score: result)
        lastRecordLabel.text = "Последний рекорд: \(result)"
    }
}

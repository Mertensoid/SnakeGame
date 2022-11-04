//
//  StartViewController.swift
//  SnakeGame
//
//  Created by admin on 04.11.2022.
//

import UIKit

class StartViewController: UIViewController {
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

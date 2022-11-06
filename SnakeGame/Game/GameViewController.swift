//
//  GameViewController.swift
//  SnakeGame
//
//  Created by admin on 04.11.2022.
//

import UIKit
import SpriteKit
import GameplayKit

protocol GameDelegate: AnyObject {
    func gameEnded(withResult result: Int)
}

final class GameViewController: UIViewController {
    @IBOutlet weak var speedLabel: UILabel!
    
    weak var delegate: GameDelegate?
    var difficulty: Difficulty = .normal

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size, difficultyFacade: DifficultyFacade(difficulty: difficulty))
        scene.scaleMode = .resizeFill
        scene.gameDelegate = self
        guard let skView = view as? SKView else { return }
        skView.showsFPS = true //включаем отображение fps (количество кадров в секунду)
        skView.showsNodeCount = true //показывать количество объектов на экране
        skView.ignoresSiblingOrder = true //включаем произволный порядок рендеринга объектов в узле
        skView.presentScene(scene)
        scene.snake?.moveSpeed.addObserver(self, options: [.initial, .new], closure: { [weak self] (moveSpeed, _) in
            self?.speedLabel.text = "Скорость: \(moveSpeed.rounded())"
        })
    }
    
    // MARK: - UIViewController
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension GameViewController: GameDelegate {
    func gameEnded(withResult result: Int) {
        delegate?.gameEnded(withResult: result)
        dismiss(animated: true)
    }
}

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

    // MARK: - Life cycle
    weak var delegate: GameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        scene.scaleMode = .resizeFill
        scene.gameDelegate = self
        guard let skView = view as? SKView else { return }
        skView.showsFPS = true //включаем отображение fps (количество кадров в секунду)
        skView.showsNodeCount = true //показывать количество объектов на экране
        skView.ignoresSiblingOrder = true //включаем произволный порядок рендеринга объектов в узле
        skView.presentScene(scene)
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

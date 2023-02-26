//
//  GameViewController.swift
//  videojuego
//
//  Created by Scott Laudick on 2/26/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var play : GameScene!
    
    @IBOutlet weak var restartButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
                    UIDevice.current.setValue(value, forKey: "orientation")
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                play = scene as? GameScene
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func jumpButtom(_ sender: Any) {
        play.cube.physicsBody?.velocity = CGVector(dx: 500, dy: 500)
    }
    
    
    @IBAction func restart(_ sender: Any) {
        play.cube.position = CGPoint(x: -617, y: -205.798)
        play.cube.physicsBody?.pinned = false
        
    }
    
}

//
//  GameScene.swift
//  videojuego
//
//  Created by Scott Laudick on 2/26/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var cube : SKSpriteNode!
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        cube = self.childNode(withName: "cube") as! SKSpriteNode
        self.camera = cam
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        cam.position = cube.position
        var curDy = cube.physicsBody?.velocity.dy
        cube.physicsBody?.velocity = CGVector(dx: 500, dy: curDy!)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        cube.physicsBody?.pinned = true
        print("hit")
    }
}

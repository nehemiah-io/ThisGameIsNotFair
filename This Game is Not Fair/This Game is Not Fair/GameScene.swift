//
//  GameScene.swift
//  This Game is Not Fair
//
//  Created by Nehemiah Odior on 8/5/16.
//  Copyright (c) 2016 Nehemiah Odior. All rights reserved.
//

import SpriteKit
import AVFoundation
import GameplayKit


class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var gameState: GKStateMachine!
    
    //character/sprites
    var hero: Hero
    var enemy: SKNode!
    
    let gameOver: GameOver
    
    
    //Button Usages
    var LeftButton: SKSpriteNode!
    var RightButton: SKSpriteNode!
    var JumpButton: SKSpriteNode!
    var ShootButton: SKSpriteNode!
    var isTouching = false
    var direction = 1
    
    
    //Scrolling World
    let scrollSpeed: CGFloat = 100
    let fixedDelta: CFTimeInterval = 1.0/60.0 /* 60 FPS */
    var ScrollLayer: SKNode!
    var sinceTouch : CFTimeInterval = 0
    let cameraNode: SKCameraNode
    
    
    //scoring and labeling
    var scoreLabel: SKLabelNode!
    var points = 0

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    
    func scrollWorld() {
        /* Scroll World */
        ScrollLayer.position.x -= scrollSpeed * CGFloat(fixedDelta)
        
        for ground in ScrollLayer.children as! [SKSpriteNode] {
            
            /* Get ground node position, convert node position to scene space */
            let groundPosition = ScrollLayer.convertPoint(ground.position, toNode: self)
            
            /* Check if ground sprite has left the scene */
            if groundPosition.x <= -ground.size.width / 2 {
                /* Reposition ground sprite to the second starting position */
                let newPosition = CGPointMake( (self.size.width / 2) + ground.size.width, groundPosition.y)
                
                /* Convert new node position back to scroll layer space */
                ground.position = self.convertPoint(newPosition, toNode: ScrollLayer)
            }
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact!){
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == PhysicsCategory.missileCategory | PhysicsCategory.enemyCategory {
            // missile hit enemy
            print("missile hit enemy")
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            points += 1
            
            scoreLabel.text = String(points)
            
            return
            
            
        } else if collision == PhysicsCategory.heroCategory | PhysicsCategory.enemyCategory {
            // hero ran into enemy
            contact.bodyA.node?.removeFromParent()
            print(" hero hit enemy")
            gameState = .GameOver
            
            
            
            
            /* Stop hero animation */
            hero.removeAllActions()
            let heroDeath = SKAction.runBlock({
                
                
                /* Stop hero from colliding with anything else */
                self.hero.physicsBody?.collisionBitMask = PhysicsCategory.noneCategory
                
            })
            
            /* Run action */
            hero.runAction(heroDeath)
            
        }
    }

    
    func scrollSceneNodes() {
        cameraNode.position.x = hero.position.x
        for node in backgrounds {
            let x = node.position.x - cameraNode.position.x
            if x < -(backgroundWidth + view!.frame.width / 2) {
                node.position.x += backgroundWidth * 2
                // addContentToSceneNode(node)
                node.ground.reconfigure()
                node.generateContent()
            }
        }
    }
    

    
    
    
    override func didMoveToView(view: SKView) {
        
         physicsWorld.contactDelegate = self
    
        
    
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
      
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

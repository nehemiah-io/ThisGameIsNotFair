//
//  Hero.swift
//  This Game is Not Fair
//
//  Created by Nehemiah Odior on 8/5/16.
//  Copyright © 2016 Nehemiah Odior. All rights reserved.
//

import SpriteKit

class Hero: SKSpriteNode {
    
    var runAction: SKAction!
    var jumpAction: SKAction!
    var shootAction: SKAction!
    var isJumping = false
    var isShooting = false
    
    init() {
        let defaultTexture = SKTexture(imageNamed: "herostanding")
        super.init(texture: defaultTexture, color: UIColor.clearColor(), size: defaultTexture.size())
        print("*HERO SETTING UP ONLINE***")
        // ----------------------------------------------------------
        // Setup run action.
        var textures = [SKTexture]()
        for i in 1...4 {
            let texture = SKTexture(imageNamed: "hero-\(i)")
            textures.append(texture)
        }
        
        // Make an action to play these texture frames
        let animate = SKAction.animateWithTextures(textures, timePerFrame: 0.025, resize: true, restore: false)
        // runs forever now
        runAction = SKAction.repeatActionForever(animate) // Save this action for later
        runAction(runAction)
        
        
        // ----------------------------------------------------------
        // Setup jump action.
        textures = []
        for i in 5...6 {
            let texture = SKTexture(imageNamed: "hero-\(i)")
            textures.append(texture)
        }
        
        // For some reason the frames are in reverse order?
        textures = textures.reverse()
        
        // An action to play the jump textures.
        let jump = SKAction.animateWithTextures(textures, timePerFrame: 0.025, resize: true, restore: false)
        
        // When the jump is finished go back to run.
        let backToRun = SKAction.runBlock {
            self.runAction(self.runAction)
            self.isJumping = false
        }
        // Save this action for later in a variable. We'll need it when you tap on the left side.
        
        
        // ----------------------------------------------------------
        // Setup shoot action
        
        textures = []
        for i in 7...10 {
            let texture = SKTexture(imageNamed: "hero-\(i)")
            textures.append(texture)
        }
        
        
        // Play the shoot textures
        let shoot = SKAction.animateWithTextures(textures, timePerFrame: 0.025, resize: true, restore: false)
        // When the shoot ends return to a run
        let endshoot = SKAction.runBlock {
            self.runAction(self.runAction)
            self.isShooting = false
        }
        // Save a shoot action for later...
        shootAction = SKAction.sequence([shoot, endshoot])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func jump() {
        // only jump if not jumping already
        if !isJumping {
            isJumping = true
            runAction(jumpAction)
        }
    }
    
    func shoot() {
        // Only shoot if not shooting already
        if !isShooting {
            isShooting = true
            runAction(shootAction)
        }
    }
    
    func bodysetup(){
        physicsBody!.categoryBitMask - PhysicsCategory.heroCategory
        physicsBody!.collisionBitMask = PhysicsCategory.enemyCategory
        physicsBody!.contactTestBitMask =  PhysicsCategory.enemyCategory
    }
    
    func deathAnimation() {
        physicsBody!.allowsRotation = true
        
        physicsBody!.categoryBitMask = PhysicsCategory.noneCategory
        physicsBody!.collisionBitMask = PhysicsCategory.noneCategory
        physicsBody!.contactTestBitMask = PhysicsCategory.noneCategory
        
        physicsBody!.applyImpulse(CGVector(dx: 0, dy: 35))
        physicsBody!.applyAngularImpulse(20)
    }
    
    func move(){
        
    }
    
    
}

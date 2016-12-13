//
//  Enemy.swift
//  This Game is Not Fair
//
//  Created by Nehemiah Odior on 8/5/16.
//  Copyright © 2016 Nehemiah Odior. All rights reserved.
//

import SpriteKit

class Enemy: SKSpriteNode {
func spawnenemies() {
    
    for i in 1...10 {
        self.spawnenemy()
        
    }
}


func spawnenemy() {
    let enemyTexture = SKTexture(imageNamed: "fireball")
    
    let enemy = SKSpriteNode(texture: enemyTexture)
    enemy.setScale(0.05)
    enemy.name = "fireball"
    
    //Mod to make enemy appear anywhere 0 to 319
    let x: CGFloat = CGFloat(arc4random() % 260)+30
    let y: CGFloat = CGFloat(arc4random() % 407)+101
    
    enemy.position = CGPoint(x: x, y: y)
    
    let enemyPhysicsSize = CGSize(width: enemy.size.width,height: enemy.size.height)
    enemy.physicsBody = SKPhysicsBody(rectangleOfSize: enemyPhysicsSize)
    enemy.physicsBody?.dynamic = true
    enemy.physicsBody?.affectedByGravity =  false
    
    physicsBody!.categoryBitMask = PhysicsCategory.enemyCategory
    physicsBody!.contactTestBitMask = PhysicsCategory.missileCategory | PhysicsCategory.heroCategory
    physicsBody!.collisionBitMask = PhysicsCategory.heroCategory
    
    
    self.addChild(enemy)
    
}
}
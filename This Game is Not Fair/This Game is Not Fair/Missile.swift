//
//  Missile.swift
//  This Game is Not Fair
//
//  Created by Nehemiah Odior on 8/5/16.
//  Copyright © 2016 Nehemiah Odior. All rights reserved.
//

import SpriteKit

class Missile: SKSpriteNode {
    
    
    
    
    
    // MARK: - Init
    
    init() {
        let missileSize = CGSize(width: 20, height: 10)
        
        super.init(texture: nil, color: UIColor.cyanColor(), size: missileSize)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    func setup() {
        
        let MissileTexture = SKTexture(imageNamed: "Missile")
        let Missile = SKSpriteNode(texture: MissileTexture)
        
        Missile.physicsBody = SKPhysicsBody(rectangleOfSize: MissileTexture.size())
        
        physicsBody!.categoryBitMask = PhysicsCategory.missileCategory
        physicsBody!.collisionBitMask = PhysicsCategory.noneCategory
        physicsBody!.contactTestBitMask = PhysicsCategory.enemyCategory
        
        physicsBody!.affectedByGravity = false
    
}

}
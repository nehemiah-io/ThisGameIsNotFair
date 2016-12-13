//
//  GameOver.swift
//  This Game is Not Fair
//
//  Created by Nehemiah Odior on 8/5/16.
//  Copyright © 2016 Nehemiah Odior. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOverState: GKState {
    unowned let scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is PlayState.Type
    }
    
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        // Animate player death
        print("Entering Game Over State From: \(previousState)")
        scene.hero.deathAnimation()
        scene.showGameOver()
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        //
    }
}

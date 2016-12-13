//
//  PlayState.swift
//  This Game is Not Fair
//
//  Created by Nehemiah Odior on 8/5/16.
//  Copyright © 2016 Nehemiah Odior. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayState: GKState {
    unowned let scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        scene.restart()
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        scene.hero.move(seconds)
        scene.scrollSceneNodes()
    }
}

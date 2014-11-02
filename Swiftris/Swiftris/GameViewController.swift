//
//  GameViewController.swift
//  Swiftris
//
//  Created by Cliff on 2014/11/02.
//  Copyright (c) 2014年 CliffTanaka. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure view
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        //create and configure screen
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        //present scene
        skView.presentScene(scene)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

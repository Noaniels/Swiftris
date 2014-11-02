//
//  GameScene.swift
//  Swiftris
//
//  Created by Cliff on 2014/11/02.
//  Copyright (c) 2014年 CliffTanaka. All rights reserved.
//

import SpriteKit
//  every 6/10ths of a second, our shape should descend by one row.
let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {
   
    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y:0)
        background.anchorPoint = CGPoint(x: 0, y:1.0)
        addChild(background)
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if lastTick == nil {
            return
        }
        var timePassed = lastTick!.timeIntervalSinceNow * -1000
        if timePassed > tickLengthMillis {
            lastTick = NSDate()
            tick?()
        }
    }
    
    func startTicking() {
        lastTick = NSDate()
    }
    
    func stopTicking() {
        lastTick = nil
    }
}

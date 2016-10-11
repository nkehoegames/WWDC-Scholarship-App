//
//  Hobbies.swift
//  WWDC Scholarship App
//
//  Created by Niall Kehoe on 01/10/2016.
//  Copyright © 2016 Niall Kehoe. All rights reserved.
//

import UIKit
import SpriteKit

class Hobbies: SKScene {
    
    var exit = SKSpriteNode(imageNamed: "Exit")
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed:"HobbiesBackground")
        background.setScale(1)
        background.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        background.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        background.physicsBody?.affectedByGravity = false
        background.physicsBody?.allowsRotation = false
        
        background.zPosition = -20
        
        
        self.addChild(background)
        
        
        
        exit.position = CGPoint(x: self.size.width / 2.9, y: self.size.height / 7 * 6.2)
        exit.physicsBody = SKPhysicsBody(rectangleOf: exit.size)
        exit.physicsBody?.affectedByGravity = false
        //exit.physicsBody?.categoryBitMask = PhysicsCategory.exit
        // exit.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
        exit.physicsBody?.isDynamic = true
        exit.name = "exit"
        
        self.addChild(exit)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            // player.position.x = location.x
            
            
            let tappednode = atPoint(location)
            let tappedNodeName: String? = tappednode.name
            
            
            if tappedNodeName == "exit" {
                if let view = self.view {
                    let scene = MenuGame(size: self.size)
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene)
                }
            }
        }
    }
}


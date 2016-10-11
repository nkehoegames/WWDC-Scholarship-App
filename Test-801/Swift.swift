//
//  Swift.swift
//  WWDC Scholarship App
//
//  Created by Niall Kehoe on 09/10/2016.
//  Copyright © 2016 Niall Kehoe. All rights reserved.
//

import UIKit
import SpriteKit

class SwiftScene: SKScene {
    var exit = SKSpriteNode(imageNamed: "Exit")
    
    override func didMove(to view: SKView) {
        exit.position = CGPoint(x: self.size.width / 2.9, y: self.size.height / 7 * 6.2)
        exit.physicsBody = SKPhysicsBody(rectangleOf: exit.size)
        exit.physicsBody?.affectedByGravity = false
        //exit.physicsBody?.categoryBitMask = PhysicsCategory.exit
        // exit.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
        exit.physicsBody?.isDynamic = true
        exit.name = "exit"
        
        self.addChild(exit)
        
    }
    
}

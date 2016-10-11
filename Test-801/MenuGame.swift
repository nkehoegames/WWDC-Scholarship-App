//
//  Menu.swift
//  WWDC Scholarship App
//
//  Created by Niall Kehoe on 01/10/2016.
//  Copyright © 2016 Niall Kehoe. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let enemy : UInt32 = 1
    static let bullet : UInt32 = 2
    static let player : UInt32 = 3
    static let myapps : UInt32 = 4
    static let fire : UInt32 = 5
    static let coding : UInt32 = 6
    static let swift : UInt32 = 7
    
}


class MenuGame: SKScene, SKPhysicsContactDelegate {
    
    var player = SKSpriteNode(imageNamed: "Spaceship-1")
    var Fire = SKSpriteNode(imageNamed: "Fire")
    var HobbiesNode = SKSpriteNode(imageNamed: "Hobbies")
    var MyAppsNode = SKSpriteNode(imageNamed: "MyApps-1")
    var CodingNode = SKSpriteNode(imageNamed: "Coding")
    var SwiftNode = SKSpriteNode(imageNamed: "Swift")
    
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        /* Setup your scene here */
        let background = SKSpriteNode(imageNamed:"background")
        background.setScale(0.2)
        background.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        background.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        background.physicsBody?.affectedByGravity = false
        background.physicsBody?.allowsRotation = false
        
        background.zPosition = -20
        
        
        self.addChild(background)
        
        player.position = CGPoint(x: self.size.width / 2, y: self.size.height / 10)
        //  player.physicsBody = SKPhysicsBody(rectangleOfSize: player.size)
        player.physicsBody?.affectedByGravity = false
        //player.physicsBody?.categoryBitMask = PhysicsCategory.player
        // player.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
        player.physicsBody?.isDynamic = true
        
        self.addChild(player)
        
        Fire.position = CGPoint(x: self.size.width / 2, y: self.size.height / 1.2)
        Fire.physicsBody = SKPhysicsBody(rectangleOf: Fire.size)
        Fire.physicsBody?.affectedByGravity = false
        Fire.physicsBody?.categoryBitMask = PhysicsCategory.fire
        Fire.physicsBody?.contactTestBitMask = PhysicsCategory.bullet
        Fire.physicsBody?.isDynamic = false
        Fire.name = "Fire"
        
        self.addChild(Fire)
        
        HobbiesNode.position = CGPoint(x: self.size.width / 2.9, y: self.size.height / 1.6)
        HobbiesNode.physicsBody = SKPhysicsBody(rectangleOf: HobbiesNode.size)
        HobbiesNode.size = CGSize(width: 130, height: 130)
        HobbiesNode.physicsBody?.categoryBitMask = PhysicsCategory.enemy
        HobbiesNode.physicsBody?.contactTestBitMask = PhysicsCategory.bullet
        HobbiesNode.physicsBody?.affectedByGravity = false
        HobbiesNode.physicsBody?.isDynamic = false
        HobbiesNode.zPosition = 0
        
        
        self.addChild(HobbiesNode)
        
        var testposition = self.size.width - self.size.width / 10
        MyAppsNode.position = CGPoint(x: self.size.width / 1.56 + 25, y: self.size.height / 1.4)
        MyAppsNode.physicsBody = SKPhysicsBody(rectangleOf: MyAppsNode.size)
        // MyAppsNode.size = CGSize(width: 150, height: 300)
        MyAppsNode.physicsBody?.categoryBitMask = PhysicsCategory.myapps
        MyAppsNode.physicsBody?.contactTestBitMask = PhysicsCategory.bullet
        MyAppsNode.physicsBody?.affectedByGravity = false
        MyAppsNode.physicsBody?.isDynamic = false
        MyAppsNode.zPosition = 0
        
        self.addChild(MyAppsNode)
        
        CodingNode.position = CGPoint(x: self.size.width / 2.4, y: self.size.height / 2.25)
        CodingNode.physicsBody = SKPhysicsBody(rectangleOf: CodingNode.size)
        // CodingNode.size = CGSize(width: 150, height: 300)
        CodingNode.physicsBody?.categoryBitMask = PhysicsCategory.coding
        CodingNode.physicsBody?.contactTestBitMask = PhysicsCategory.bullet
        CodingNode.physicsBody?.affectedByGravity = false
        CodingNode.physicsBody?.isDynamic = false
        CodingNode.zPosition = 0
        
        
        self.addChild(CodingNode)
        
        SwiftNode.position = CGPoint(x: self.size.width / 1.67, y: self.size.height / 2.2)
        SwiftNode.physicsBody = SKPhysicsBody(rectangleOf: SwiftNode.size)
        SwiftNode.size = CGSize(width: 110, height: 110)
        SwiftNode.physicsBody?.categoryBitMask = PhysicsCategory.swift
        SwiftNode.physicsBody?.contactTestBitMask = PhysicsCategory.bullet
        SwiftNode.physicsBody?.affectedByGravity = false
        SwiftNode.physicsBody?.isDynamic = false
        SwiftNode.zPosition = 0
        
        
        self.addChild(SwiftNode)
        
        print("working")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            
            // player.position.x = location.x
            
            
            let tappednode = atPoint(location)
            let tappedNodeName: String? = tappednode.name
            
            if tappedNodeName == "Fire" {
                //MARK: Spawn Bullet
                let bullet = SKSpriteNode(imageNamed: "Bullet.png")
                bullet.zPosition = 0
                bullet.position = CGPoint(x: player.position.x, y: player.position.y)
                let action = SKAction.moveTo(y: self.size.height + 10, duration: 2.0)
                let actiondone = SKAction.removeFromParent()
                bullet.run(SKAction.sequence([action, actiondone]))
                
                bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
                bullet.physicsBody?.categoryBitMask = PhysicsCategory.bullet
                bullet.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
                bullet.physicsBody?.affectedByGravity = false
                bullet.physicsBody?.isDynamic = true
                
                
                self.addChild(bullet)
                
                player.zRotation = 0

            } else {
                let location = touch.location(in: self)
                
                player.position.x = location.x
            }
        }
    }
    
    /*  func didBeginContact(contact: SKPhysicsContact) {
     var firstBody : SKPhysicsBody = contact.bodyA
     var secondBody : SKPhysicsBody = contact.bodyB
     print("boodsds")
     
     if ((firstBody.categoryBitMask == PhysicsCategory.enemy) && (secondBody.categoryBitMask == PhysicsCategory.bullet)) || ((firstBody.categoryBitMask == PhysicsCategory.bullet) && (secondBody.categoryBitMask == PhysicsCategory.enemy)) {
     print("Hobbies")
     
     } else if ((firstBody.categoryBitMask == PhysicsCategory.enemy) && (secondBody.categoryBitMask == PhysicsCategory.player)) || ((firstBody.categoryBitMask == PhysicsCategory.player) && (secondBody.categoryBitMask == PhysicsCategory.enemy)) {
     
     
     }
     } */
    
    func collisionwithBullet(_ bullet: SKSpriteNode) {
        bullet.removeFromParent()
    }
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        let firstBody : SKPhysicsBody = contact.bodyA
        let secondBody : SKPhysicsBody = contact.bodyB
        
        
        if ((firstBody.categoryBitMask == PhysicsCategory.enemy) && (secondBody.categoryBitMask == PhysicsCategory.bullet)) || ((firstBody.categoryBitMask == PhysicsCategory.bullet) && (secondBody.categoryBitMask == PhysicsCategory.enemy)) {
            print("Hobbies")
            
            if let view = self.view {
                let scene = Hobbies(size: self.size)
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            
        } else if ((firstBody.categoryBitMask == PhysicsCategory.myapps) && (secondBody.categoryBitMask == PhysicsCategory.bullet)) || ((firstBody.categoryBitMask == PhysicsCategory.bullet) && (secondBody.categoryBitMask == PhysicsCategory.myapps)) {
            if let view = self.view {
                let scene = MyApps(size: self.size)
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            
        } else if ((firstBody.categoryBitMask == PhysicsCategory.fire) && (secondBody.categoryBitMask == PhysicsCategory.bullet)) {
            
            collisionwithBullet(secondBody.node as! SKSpriteNode)
            
        } else if ((firstBody.categoryBitMask == PhysicsCategory.bullet) && (secondBody.categoryBitMask == PhysicsCategory.fire)) {
            collisionwithBullet(firstBody.node as! SKSpriteNode)
            
        } else if ((firstBody.categoryBitMask == PhysicsCategory.coding) && (secondBody.categoryBitMask == PhysicsCategory.bullet)) || ((firstBody.categoryBitMask == PhysicsCategory.bullet) && (secondBody.categoryBitMask == PhysicsCategory.coding)) {
            
            if let view = self.view {
                let scene = Coding(size: self.size)
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            
        } else if ((firstBody.categoryBitMask == PhysicsCategory.coding) && (secondBody.categoryBitMask == PhysicsCategory.bullet)) || ((firstBody.categoryBitMask == PhysicsCategory.bullet) && (secondBody.categoryBitMask == PhysicsCategory.coding)) {
            
            if let view = self.view {
                let scene = Coding(size: self.size)
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            } else if ((firstBody.categoryBitMask == PhysicsCategory.swift) && (secondBody.categoryBitMask == PhysicsCategory.bullet)) || ((firstBody.categoryBitMask == PhysicsCategory.bullet) && (secondBody.categoryBitMask == PhysicsCategory.swift)) {
                
                if let view = self.view {
                    let scene = SwiftScene(size: self.size)
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene)
                } else {
                
                
                
            }
            
            
            
            /*else if ((firstBody.categoryBitMask == PhysicsCategory.fire) && (secondBody.categoryBitMask == PhysicsCategory.bullet)) {
             collisionwithBullet(secondBody.node as! SKSpriteNode)
             Fire.position = CGPointMake(self.size.width / 2, self.size.height / 1.3)
             print("boo")
             } else if ((firstBody.categoryBitMask == PhysicsCategory.bullet) && (secondBody.categoryBitMask == PhysicsCategory.fire)) {
             print("boodf")
             collisionwithBullet(firstBody.node as! SKSpriteNode)
             Fire.position = CGPointMake(self.size.width / 2, self.size.height / 1.3)
             } */
            
        }
        
        func touchesMoved(touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                let location = touch.location(in: self)
                
                
                
                player.position.x = location.x
                
                
                
            }
            
            
            
        }
        
        func SpawnBullet() {
            let bullet = SKSpriteNode(imageNamed: "Bullet.png")
            bullet.zPosition = 0
            bullet.position = CGPoint(x: player.position.x, y: player.position.y)
            let action = SKAction.moveTo(y: self.size.height + 10, duration: 2.0)
            let actiondone = SKAction.removeFromParent()
            bullet.run(SKAction.sequence([action, actiondone]))
            
            bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
            bullet.physicsBody?.categoryBitMask = PhysicsCategory.bullet
            bullet.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
            bullet.physicsBody?.affectedByGravity = false
            bullet.physicsBody?.isDynamic = true
            
            
            self.addChild(bullet)
            
            player.zRotation = 0
            
        }
        
     } 

 }
}

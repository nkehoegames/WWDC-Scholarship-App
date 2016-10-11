//
//  GameScene.swift
//  Test-801
//
//  Created by Niall Kehoe on 24/09/2016.
//  Copyright (c) 2016 Niall Kehoe. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let labelt = SKLabelNode()
    let go = SKLabelNode()
    
    var label2 = UILabel()
    
    var quotenumber = 0
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        let background = SKSpriteNode(imageNamed:"backgroundmenu")
        background.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        background.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        background.physicsBody?.affectedByGravity = false
        background.physicsBody?.allowsRotation = false
        
        background.zPosition = -20
        
        
        self.addChild(background)
        
        var timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(GameScene.quotechange), userInfo: nil, repeats: true)
        
      /*  labelt.text = "“Stay hungry. Stay foolish.” - Steve Jobs"
        labelt.fontSize = 29
        labelt.fontName = "KannadaSangamMN-Bold"
        
        labelt.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        labelt.color = UIColor.whiteColor()
        
        self.addChild(labelt)*/
        
        go.text = "Go!"
        go.fontSize = 60
        go.fontName = "GillSans"
        go.fontColor = UIColor.yellow
        go.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 12)
        go.name = "Go"
        
    //    var animateList = SKAction.sequence([SKAction.fadeInWithDuration(1.0), SKAction.fadeOutWithDuration(1.0)])
        
   //     go.runAction(animateList)
            
        self.addChild(go)
     
        /*label.text = "Go!"
        label.fontName = "GillSans"
        label.fontColor = UIColor.yellowColor()
        label.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 12)
        label.name = "Go"
        label.textAlignment = NSTextAlignment.Center
        label.numberOfLines = 0 */
        
        var value = self.frame.size.width
 
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
       label2 = UILabel(frame: CGRect(x: 40, y: -100, width: screenWidth, height: screenHeight * 0.65)) //1: width where, 2: height where,
        label2.textAlignment = NSTextAlignment.center
        label2.numberOfLines = 0
        label2.text = "“Stay hungry. Stay foolish.” - Steve Jobs"
        label2.textColor = UIColor.white
        label2.font = UIFont(name: "KannadaSangamMN-Bold", size: 29) //UIFont.systemFontOfSize(60.0)
        label2.center = CGPoint(x: screenWidth * 0.5, y: -100)// screenHeight * 0.5)
        
        
      /*
        UIView.animateWithDuration(2.0, delay: 0.5, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
            
            self.label2.center = CGPoint(x: screenWidth * 0.5, y: 0 + screenHeight * 0.50)
            
            }, completion: nil)
        */
        
        test()
        print(screenWidth)
        print(screenHeight)
        self.view!.addSubview(label2)

        
    }
    
    func test() {
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        
        UIView.animate(withDuration: 2.0, delay: 0.5, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
            
            self.label2.center = CGPoint(x: screenWidth * 0.5, y: 0 + screenHeight * 0.50)
            
            }, completion: nil)
    }
    
    func quotechange() {
        print("working")
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        label2.center = CGPoint(x: screenWidth * 0.5, y: -100)// screenHeight * 0.5)
        
        
        test()
        if quotenumber == 0 {
            label2.text = "“Stay hungry. Stay foolish.” - Steve Jobs"
            quotenumber += 1
            print("1")
        } else if quotenumber == 1 {
            label2.text = "“You never lose a dream, it just incubates as a hobby” - Larry Page"
            quotenumber += 1
            print("2")
        } else if quotenumber == 2 {
            label2.text = "“Move fast and break things. Unless you are breaking stuff you are not moving fast enough” - Mark Zuckerberg"
            quotenumber += 1
            print("3")
        } else if quotenumber == 3 {
            label2.text = "“The best way to predict the future is to invent it” - Alan Kay"
            quotenumber += 1
            print("4")
        } else if quotenumber == 4 {
            label2.text = "“The sidelines are not where you want to live your life. The world needs you in the arena.” - Tim Cook"
            quotenumber += 1
            print("5")
        } else if quotenumber == 5 {
            label2.text = "“Be nice to nerds. Chances are you'll end up working for one.” - Bill Gates"
            quotenumber = 0
            print("5")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            
            // player.position.x = location.x
            
            
            let tappednode = atPoint(location)
            let tappedNodeName: String? = tappednode.name
            
            if tappedNodeName == "Go" {
               // var animateList = SKAction.sequence([SKAction.fadeInWithDuration(0.5), SKAction.fadeOutWithDuration(0.5)])
                
             //   go.runAction(animateList)
                var timer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(GameScene.Move), userInfo: nil, repeats: false)
               
            }
            
        }
    }
   
    func Move() {
        if let view = self.view {
            label2.isHidden = true
            let scene = MenuGame(size: self.size)
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
        }
    }
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}

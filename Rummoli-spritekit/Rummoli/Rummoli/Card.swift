//
//  Card.swift
//  Rummoli
//
//  Created by Scott Mayhew on 2015-09-08.
//  Copyright (c) 2015 Huge Holdings Inc. All rights reserved.
//

import SpriteKit

class Card: SKSpriteNode {

    var rank: Int
    var suit: String
    var imageNameUp: String
    var textureUp: SKTexture
    var textureDown: SKTexture
    
    init(rank: Int, suit: String, faceUp: Bool) {
        
        self.rank = rank
        self.suit = suit
        self.imageNameUp = "\(suit)_\(rank)" // Clubs_6
        self.textureUp = SKTexture(imageNamed: imageNameUp)
        self.textureDown = SKTexture(imageNamed: "Back")
        var texture = SKTexture()
        
        if faceUp {
            texture = textureUp
        }else{
            texture = textureDown
        }
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        
    }
    
    func flip() {
        self.texture = textureUp
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


//Card(rank:6,suit: "club", faceUp: false)
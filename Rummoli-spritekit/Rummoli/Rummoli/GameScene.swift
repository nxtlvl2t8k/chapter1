//
//  GameScene.swift
//  Rummoli
//
//  Created by Scott Mayhew on 2015-09-08.
//  Copyright (c) 2015 Huge Holdings Inc. All rights reserved.
//
import SpriteKit

class GameScene: SKScene {
    
    var suits = [String]()
    var deck = [Card]()
    
    var nextCard = [Card]()
    var playedCard = [Card]()
    
    var MeCards = [Card]()
    var player2Cards = [Card]()
    var widowCards = [Card]()
    
    var MeCardPositions = [CGPoint]()
    var player2CardPositions = [CGPoint]()
    var widowCardPositions = [CGPoint]()
    
    let cardOffset: CGFloat = 25
    let sides: CGFloat = 30
    
    var discardPosition = CGPoint()
    var discardCard = [Card]()
    var MePlayingPosition = CGPoint()
    var MePlayingCard = [Card]()
    var player2PlayingPosition = CGPoint()
    var player2PlayingCard = [Card]()
    var widowPlayingPosition = CGPoint()
    var widowPlayingCard = [Card]()
    
    var MeLabel = SKLabelNode()
    var player2Label = SKLabelNode()
    var widowLabel = SKLabelNode()
    
    var MeScoreLabel = SKLabelNode()
    var player2ScoreLabel = SKLabelNode()
    
    var player2move: Int = 0
    var widowmove: Int = 0
    var MeScore: Int = 0
    var player2Score: Int = 0
    
    var currentPlayer: Int = 0
    var gameInProgress: Bool = false
    var switchToRed: Bool = false
    var switchToBlack: Bool = true
    
    override init(size:CGSize){
        super.init(size: size)
        
        self.backgroundColor = SKColor.greenColor()
        self.suits = ["Spades","Diamonds", "Clubs", "Hearts"]
        
        // Testing by placing a card in the middle
        // let texture = SKTexture(imageNamed: "Clubs_5")
        // let card = SKSpriteNode(texture: texture)
        // card.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        // self.addChild(card)
        
        // let card:Card = Card(rank: 7, suit: "Spades", faceUp: false)
        // card.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        // self.addChild(card)
        
        dealCards()
        
        let centerCard = SKSpriteNode(imageNamed: "Back")
        //centerCard.position = CGPointMake(CGRectGetMinX(self.frame) + 40, CGRectGetMidY(self.frame) + 50)
        centerCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(centerCard)
        
        //Discard Pile
        let newX = centerCard.position.x
        let newY = centerCard.position.y //centerCard.position.y - centerCard.size.height/2 + cardOffset + centerCard.size.height/2
        discardPosition = CGPoint(x: newX, y: newY)
        
        MeLabel = SKLabelNode(fontNamed: "HelveticaNeue_Bold")
        MeLabel.fontColor = SKColor.brownColor()
        MeLabel.fontSize = 40
        MeLabel.text = "You"
        
        MeLabel.position = CGPointMake(CGRectGetMidX(self.frame) - MeLabel.frame.width/2, sides/2 - MeLabel.frame.height/2)
        self.addChild(MeLabel)
        
        player2Label = SKLabelNode(fontNamed: "HelveticaNeue_Bold")
        player2Label.fontColor = SKColor.brownColor()
        player2Label.fontSize = 40
        player2Label.text = "2"
        
        player2Label.position = CGPointMake(sides/2, CGRectGetMidY(self.frame) + player2Label.frame.width/2)
        self.addChild(player2Label)

        widowLabel = SKLabelNode(fontNamed: "HelveticaNeue_Bold")
        widowLabel.fontColor = SKColor.brownColor()
        widowLabel.fontSize = 40
        widowLabel.text = "3"
        
        widowLabel.position = CGPointMake(CGRectGetMidX(self.frame) - widowLabel.frame.width/2, self.frame.height - sides/2 - widowLabel.frame.height/2)
        self.addChild(widowLabel)
        
        
        //Score Label Nodes
        MeScoreLabel = SKLabelNode(fontNamed: "Courier-Bold")
        player2ScoreLabel = SKLabelNode(fontNamed: "Courier-Bold")
        
        MeScoreLabel.fontSize = 20
        player2ScoreLabel.fontSize = 20
        
        MeScoreLabel.text = "Score:\(MeScore)"
        player2ScoreLabel.text = "Score:\(player2Score)"
        
        MeScoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), sides + centerCard.frame.height + 20)
        player2ScoreLabel.position = CGPointMake(sides + centerCard.frame.width + cardOffset + player2ScoreLabel.frame.width/2, CGRectGetMidY(self.frame))
        
        self.addChild(MeScoreLabel)
        self.addChild(player2ScoreLabel)
        
        //                //Testing Helper Method
        //                var testCards = [Card]()
        //
        //                let card1 = Card(rank: 3, suit: "Spades", faceUp: false)
        //                let card2 = Card(rank: 5, suit: "Spades", faceUp: false)
        //                let card3 = Card(rank: 9, suit: "Spades", faceUp: false)
        //                let card4 = Card(rank: 12, suit: "Spades", faceUp: false)
        //                let card5 = Card(rank: 13, suit: "Spades", faceUp: false)
        //
        //                testCards.append(card1)
        //                testCards.append(card2)
        //                testCards.append(card3)
        //                testCards.append(card4)
        //                testCards.append(card5)
        //
        //        let anotherCard = getSmallerOrBiggerCards(testCards, rankToCompare: 4, whichOne: "bigger"),
        //        println(anotherCard.rank)
        
        
        
    }
    
    func playcard(player player: Int) {
        
        if player == 2 {
            
            var player2SpadeCards = [Card]()
            var player2DiamondCards = [Card]()
            var player2ClubCards = [Card]()
            var player2HeartCards = [Card]()
            
            for card in player2Cards {
                if card.suit == "Spades" {
                    player2SpadeCards.append(card)
                }else if card.suit == "Diamonds" {
                    player2DiamondCards.append(card)
                }else if card.suit == "Clubs" {
                    player2ClubCards.append(card)
                }else if card.suit == "Hearts" {
                    player2HeartCards.append(card)
                }
            }
            
            if playedCard.count == 0 {
                //NOTE TO Self - May not have any suit cards in hand
                if player2ClubCards[0].rank <= player2SpadeCards[0].rank {
                    if player2ClubCards.count > 0 {
                            player2PlayingCard.append(getSmallestOrBiggestCard(player2ClubCards, whichOne: "smallest"))
                    }
                }else if player2SpadeCards.count > 0 {
                    player2PlayingCard.append(getSmallestOrBiggestCard(player2SpadeCards, whichOne: "smallest"))
                }
            }
            if playedCard.count > 0 {
                for card in player2Cards {
                    if card.suit == playedCard[playedCard.count - 1].suit && card.rank == playedCard[playedCard.count - 1].rank + 1 {
                        if haveSmallerOrBiggerCard(player2Cards, rankToCompare: playedCard[playedCard.count - 1].rank + 1, whichOne: "bigger") {
                            player2PlayingCard.append(card)
                            break
                        }

                        
                        if player2HeartCards[0].rank <= player2DiamondCards[0].rank && card.rank >= 14{
                                    if player2HeartCards.count > 0 {
                                        player2PlayingCard.append(getSmallestOrBiggestCard(player2HeartCards, whichOne: "smallest"))
                                    break
                                    }
                                    if player2DiamondCards.count > 0 {
                                        player2PlayingCard.append(getSmallestOrBiggestCard(player2DiamondCards, whichOne: "smallest"))
                                    break
                                }
                            }
                        }
                
                    
                    
                    
                
                
//                    }
//                    if switchToRed {
//                        print("player2-2-\(switchToBlack)-\(switchToRed)-\(card.rank)-\(card.suit)")
//                        if card.suit == playedCard[playedCard.count - 1].suit && card.rank == playedCard[playedCard.count - 1].rank + 1 {
//                            if haveSmallerOrBiggerCard(player2Cards, rankToCompare: playedCard[playedCard.count - 1].rank + 1, whichOne: "bigger") {
//                                player2PlayingCard.append(card)
//                                break
//                            }
//                        }
//                        if card.rank == 14 {
//                            switchToRed = false
//                            switchToBlack = true
//                            print("player2black14-\(switchToBlack)-\(switchToRed)-\(card.rank)-\(card.suit)")
//                            if player2ClubCards[0].rank <= player2SpadeCards[0].rank {
//                                if player2ClubCards.count > 0 {
//                                        player2PlayingCard.append(getSmallestOrBiggestCard(player2ClubCards, whichOne: "smallest"))
//                                    }else{
//                                    if player2SpadeCards.count > 0 {
//                                        player2PlayingCard.append(getSmallestOrBiggestCard(player2SpadeCards, whichOne: "smallest"))
//                                        
//                                    }
//                                }
//                            }
//                        }
//                    }
                }
            }
        
            moveCard(node: player2PlayingCard[player2move], player: self.currentPlayer)
            player2move++
        }
    }

//        if player == 3 {
//            
//            var widowSpadeCards = [Card]()
//            var widowDiamondCards = [Card]()
//            var widowClubCards = [Card]()
//            var widowHeartCards = [Card]()
//            
//            for card in widowCards {
//                if card.suit == "Spades" {
//                    widowSpadeCards.append(card)
//                }else if card.suit == "Diamonds" {
//                    widowDiamondCards.append(card)
//                }else if card.suit == "Clubs" {
//                    widowClubCards.append(card)
//                }else if card.suit == "Hearts" {
//                    widowHeartCards.append(card)
//                }
//            }
//            
//            if playedCard.count == 0 {
//                //NOTE TO Self - May not have any suit cards in hand
//                if widowSpadeCards.count > 0 {
//                    if widowClubCards.count > 0 {
//                        if widowClubCards[0].rank <= widowSpadeCards[0].rank {
//                            widowPlayingCard.append(getSmallestOrBiggestCard(widowClubCards, whichOne: "smallest"))
//                            nextCard[0].suit == "Spades" && nextCard[0].rank == widowSpadeCards[0].rank + 1
//                        }else{
//                            widowPlayingCard.append(getSmallestOrBiggestCard(widowSpadeCards, whichOne: "smallest"))
//                            nextCard[0].suit == "Spades" && nextCard[0].rank == widowSpadeCards[0].rank + 1
//                            
//                        }
//                    }
//                }
//            }else{
//                for card in widowCards {
//                    
//                    print("Widow -\(card.rank)-\(card.suit)")
//                    if card.suit == playedCard[playedCard.count - 1].suit {
//                        if card.rank == playedCard[playedCard.count - 1].rank + 1 {
//                        if haveSmallerOrBiggerCard(widowCards, rankToCompare:  nextCard[0].rank, whichOne: "bigger") {
//                            widowPlayingCard.append(card)
//                            nextCard[0].suit == playedCard[playedCard.count - 1].suit && nextCard[0].rank == playedCard[playedCard.count - 1].rank + 1
//                            break
//                            }
//                            //                            player2PlayingCard.append(haveSmallerOrBiggerCard(player2Cards, rankToCompare: playedCard[playedCard.count - 1].rank, whichOne: "bigger")
//                        }
//                    }
//                }
//            }
//            moveCard(node: widowPlayingCard[widowmove], player: self.currentPlayer)
//            widowmove++
//        }
//        
//    }
    
    
    
    func dealCards() {
        
        for i in 0...suits.count - 1 {
            for j in 2...14 {
                let card: Card = Card(rank: j, suit: suits[i], faceUp: false)
                deck.append(card)
                nextCard.append(card)
            }
            
        }
        //for i in 0...deck.count - 1 {
        //  println("\(deck[i].suit)_\(deck[i].rank)")
        
        var player: Int = 1
        //        var roundDealer: Int = 1
        
        let deal = SKAction.runBlock{ () -> Void in
            
            while self.deck.count > 0 { // if Deck count is 51
                
                let index: Int = Int(arc4random_uniform(UInt32(self.deck.count))) // a number between 0 and 51
                
                if player == 1 {
                    
                    //                    if roundDealer == 1 {
                    self.MeCards.append(self.deck[index])
                    let removedCard = self.deck.removeAtIndex(index)
                    
                    removedCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
                    self.addChild(removedCard)
                    removedCard.flip()
                    
                    let newX: CGFloat = (self.size.width - (self.cardOffset * 18 + removedCard.size.width))/2 + removedCard.size.width/2 + CGFloat(self.MeCards.count - 1) * self.cardOffset/1.5
                    let newY: CGFloat = removedCard.size.height / 2 + self.sides //- 55
                    self.MeCardPositions.append(CGPoint(x: newX, y: newY))
                    
                    let move = SKAction.moveTo(CGPointMake(newX, newY), duration: 1.0)
                    removedCard.runAction(move)
                    
                    //                    player = 0
                    
                    //                    }
                }
                if player == 2 {
                    
                    self.player2Cards.append(self.deck[index])
                    let removedCard = self.deck.removeAtIndex(index)
                    
                   //                     removedCard.size.height = 24
                   //                     removedCard.size.width = 18
                    removedCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
                    self.addChild(removedCard)
                    removedCard.flip()
                    
                    //let newX: CGFloat = (self.size.width - (self.cardOffset * 12 + removedCard.size.width))/2 + removedCard.size.width/2 + CGFloat(self.player2Cards.count - 1) * self.cardOffset
                    //let newY: CGFloat = self.size.height - self.sides + 55 - removedCard.size.height / 2
                    
                    let newX: CGFloat = (self.size.width - (self.cardOffset * 10 + removedCard.size.width)) + removedCard.size.width/2 + CGFloat(self.player2Cards.count - 1) * self.cardOffset/3
                    //                    let newX: CGFloat = removedCard.size.width/2 + self.sides
                    //                    let cardsHeight = self.cardOffset * 12 + removedCard.size.height/2
                    //                    let bottomEdge = (self.size.height - cardsHeight) / 2
                    //                    let topEdge = self.size.height - bottomEdge
                    let newY: CGFloat = self.size.height - self.sides / 2 - removedCard.size.height / 2
                    //                    let newY: CGFloat = topEdge - removedCard.size.width/2 - CGFloat(self.player2Cards.count - 1) * self.cardOffset
                    self.player2CardPositions.append(CGPoint(x: newX, y: newY))
                    
                    let move = SKAction.moveTo(CGPointMake(newX, newY), duration: 1.0)
                    removedCard.runAction(move)
                    
                }
//                if player == 3 {
//                    
//                    self.widowCards.append(self.deck[index])
//                    let removedCard = self.deck.removeAtIndex(index)
//                    
//                    //                    removedCard.size.height = 24
//                    //                    removedCard.size.width = 18
//                    removedCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
//                    self.addChild(removedCard)
//                    removedCard.flip()
//                    
//                    //let newX: CGFloat = (self.size.width - (self.cardOffset * 12 + removedCard.size.width))/2 + removedCard.size.width/2 + CGFloat(self.player2Cards.count - 1) * self.cardOffset
//                    //let newY: CGFloat = self.size.height - self.sides + 55 - removedCard.size.height / 2
//                    
//                    let newX: CGFloat = (self.size.width - (self.cardOffset * 10 + removedCard.size.width)) + removedCard.size.width/2 + CGFloat(self.widowCards.count - 1) * self.cardOffset/3
//                    //                    let newX: CGFloat = removedCard.size.width/2 + self.sides
//                    //                    let cardsHeight = self.cardOffset * 12 + removedCard.size.height/2
//                    //                    let bottomEdge = (self.size.height - cardsHeight) / 2
//                    //                    let topEdge = self.size.height - bottomEdge
//                    let newY: CGFloat = self.size.height - self.sides / 2 - removedCard.size.height / 2 - 100
//                    //                    let newY: CGFloat = topEdge - removedCard.size.width/2 - CGFloat(self.player2Cards.count - 1) * self.cardOffset
//                    self.widowCardPositions.append(CGPoint(x: newX, y: newY))
//                    
//                    let move = SKAction.moveTo(CGPointMake(newX, newY), duration: 1.0)
//                    removedCard.runAction(move)
//                    
//                }
                
                
                player++
                if player == 3 {
                    player = 1
                }
            }
        }
        
        //self.runAction(deal)
        
        
        let delay = SKAction.waitForDuration(1.5)
        
        let sort = SKAction.runBlock { () -> Void in
            
//            self.widowCards = self.sortCards(self.widowCards)
            self.MeCards = self.sortCards(self.MeCards)
            self.player2Cards = self.sortCards(self.player2Cards)
            
//            for i in 0...self.widowCards.count - 1 {
//                self.widowCards[i].zPosition = CGFloat(self.widowCards[i].rank) + self.cardType(self.widowCards[i].suit)
//                let move = SKAction.moveTo(self.widowCardPositions[i], duration: 1.0)
//                self.widowCards[i].runAction(move)
//            }

            for i in 0...self.MeCards.count - 1 {
                self.MeCards[i].zPosition = CGFloat(self.MeCards[i].rank) + self.cardType(self.MeCards[i].suit)
                let move = SKAction.moveTo(self.MeCardPositions[i], duration: 1.0)
                self.MeCards[i].runAction(move)
            }
            
            for i in 0...self.player2Cards.count - 1 {
                self.player2Cards[i].zPosition = CGFloat(self.player2Cards[i].rank) + self.cardType(self.player2Cards[i].suit)
                let move = SKAction.moveTo(self.player2CardPositions[i], duration: 1.0)
                self.player2Cards[i].runAction(move)
            }
        }
        
        let sequence = SKAction.sequence([deal, delay, sort, delay])
        
        self.runAction(sequence, completion: { () -> Void in
            // let move = SKAction.moveTo(self.MePlayingPosition, duration: 1.0)
            // self.MeCards[0].runAction(move)
            self.gameInProgress = true
            let turn: Int = Int(arc4random_uniform(2) + 1)
            
            self.currentPlayer = turn
            self.flashCurrentPlayer(turn)
            
            if self.currentPlayer != 1 {
                self.playcard(player: self.currentPlayer)
            }
            
        })
    }
    
    func flashCurrentPlayer(player: Int) {
        //        print("Player: \(player)'s turn")
        
        let fadeOut = SKAction.fadeAlphaTo(0, duration: 0.5)
        let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 0.5)
        let sequence = SKAction.sequence([fadeOut,fadeIn])
        let repeatForEver = SKAction.repeatActionForever(sequence)
        
        if player == 1 {
            
            MeLabel.runAction(repeatForEver)
            player2Label.removeAllActions()
            widowLabel.removeAllActions()
            
            let alpha = SKAction.fadeAlphaTo(1.0, duration: 1.0)
            player2Label.runAction(alpha)
            widowLabel.runAction(alpha)
            
        }else if player == 2 {
            player2Label.runAction(repeatForEver)
            MeLabel.removeAllActions()
            widowLabel.removeAllActions()
            
            let alpha = SKAction.fadeAlphaTo(1.0, duration: 1.0)
            MeLabel.runAction(alpha)
            widowLabel.runAction(alpha)
            
//        }else if player == 3 {
//            widowLabel.runAction(repeatForEver)
//            MeLabel.removeAllActions()
//            player2Label.removeAllActions()
//            
//            let alpha = SKAction.fadeAlphaTo(1.0, duration: 1.0)
//            MeLabel.runAction(alpha)
//            player2Label.runAction(alpha)
        }
    }

    func moveCard(node node: Card, player: Int) {
        
        if player == 1 {
            
            let move = SKAction.moveTo(discardPosition, duration: 1.5)
            node.runAction(move, completion: { () -> Void in
                
                self.playedCard.append(node)
                self.MePlayingCard.append(node)
                
                for i in 0...self.MeCards.count - 1 {
                    
                    if node.rank == self.MeCards[i].rank && node.suit == self.MeCards[i].suit {
                        self.MeCards.removeAtIndex(i)
                        break
                    }
                }
                self.checkCurrentMove(self.currentPlayer)
            })
            
            
        }else if player == 2 {
            //node.flip()
            
            let move = SKAction.moveTo(discardPosition, duration: 1.5)
            node.runAction(move, completion: { () -> Void in
                
                self.playedCard.append(node)
                // self.player2PlayingCard.append(node)
                
                for i in 0...self.player2Cards.count - 1 {
                    
                    if node.rank == self.player2Cards[i].rank && node.suit == self.player2Cards[i].suit {
                        
                        self.player2Cards.removeAtIndex(i)
                        break
                    }
                }
                self.checkCurrentMove(self.currentPlayer)
            })
            
//        }else if player == 3 {
//            //node.flip()
//            
//            let move = SKAction.moveTo(discardPosition, duration: 1.5)
//            node.runAction(move, completion: { () -> Void in
//                
//                self.playedCard.append(node)
//                // self.widowPlayingCard.append(node)
//                
//                for i in 0...self.widowCards.count - 1 {
//                    
//                    if node.rank == self.widowCards[i].rank && node.suit == self.widowCards[i].suit {
//                    
//                        self.widowCards.removeAtIndex(i)
//                        break
//                    }
//                }
//                self.checkCurrentMove(self.currentPlayer)
//            })
//            
        }
    }
    
    func displayMessage(msg msg: String) {
        
        let message = SKLabelNode(fontNamed: "Arial")
        message.fontSize = 40
        message.fontColor = SKColor.blackColor()
        message.text = msg
        message.position = CGPointMake(CGRectGetMidX(self.frame), 200)
        message.zPosition = 100
        self.addChild(message)
        
        let fadeOut = SKAction.fadeAlphaTo(0, duration: 2.0)
        let remove = SKAction.removeFromParent()
        let fadeSequence = SKAction.sequence([fadeOut, remove])
        
        let scale = SKAction.scaleTo(1.5, duration: 1.8)
        
        let messageAnnimation = SKAction.group([fadeSequence, scale])
        message.runAction(messageAnnimation)
        
    }
    
    func checkCurrentMove(player: Int) {
        
        if playedCard.count <= 51 {
            for k in 0...player2Cards.count - 1 {
                for i in 0...MeCards.count - 1 {
//                    for j in 0...widowCards.count - 1 {
                    
                        if player == 1 {
                            
                            
                            if MeCards[i].suit == playedCard[playedCard.count - 1].suit && MeCards[i].rank == playedCard[playedCard.count - 1].rank + 1{
                                if playedCard[playedCard.count - 1].suit == "Spades" || playedCard[playedCard.count - 1].suit == "Clubs" && playedCard[playedCard.count - 1].rank + 1 >= 14 {
                                    switchToRed = true
                                    switchToBlack = false
                                }
//                                
//                                if playedCard[playedCard.count - 1].suit == "Spades" && playedCard[playedCard.count - 1].rank + 1 == 10 {
//                                    MeScore += 15
//                                }
//                                if playedCard[playedCard.count - 1].suit == "Diamonds" && playedCard[playedCard.count - 1].rank + 1 == 11 {
//                                    MeScore += 15
//                                }
                                
                                currentPlayer = 1
                                flashCurrentPlayer(currentPlayer)
                                playcard(player: currentPlayer)
                                //self.checkWin()
                                break
                            
                            
                            }
                            if player2Cards[k].suit == playedCard[playedCard.count - 1].suit && player2Cards[k].rank == playedCard[playedCard.count - 1].rank + 1{
                                currentPlayer = 2
                                flashCurrentPlayer(currentPlayer)
                                playcard(player: currentPlayer)
                                //self.checkWin()
                                break
                            }
                            //                                    if widowCards[j].suit == playedCard[playedCard.count - 1].suit && widowCards[j].rank == playedCard[playedCard.count - 1].rank{
                            //                                        currentPlayer = 3
                            //                                        nextCard[0].suit == playedCard[playedCard.count - 1].suit && nextCard[0].rank == playedCard[playedCard.count - 1].rank + 1
                            //                                        flashCurrentPlayer(currentPlayer)
                            //                                        playcard(player: currentPlayer)
                            //                                        //self.checkWin()
                            //                                        break
                            //
                            //
                            //
                            //                            }
                            //
                            
                    }
                    if player == 2 {
                        
                        if player2Cards[k].suit == playedCard[playedCard.count - 1].suit && player2Cards[k].rank == playedCard[playedCard.count - 1].rank + 1{
                            if playedCard[playedCard.count - 1].suit == "Spades" || playedCard[playedCard.count - 1].suit == "Clubs" && playedCard[playedCard.count - 1].rank + 1 >= 14 {
                            switchToRed = true
                            switchToBlack = false
                            }
//                            if playedCard[playedCard.count - 1].suit == "Spades" && playedCard[playedCard.count - 1].rank + 1 == 10 {
//                                player2Score += 15
//                            }
//                            if playedCard[playedCard.count - 1].suit == "Diamonds" && playedCard[playedCard.count - 1].rank + 1 == 11 {
//                                player2Score += 15
//                            }
                        
                            currentPlayer = 2
                            flashCurrentPlayer(currentPlayer)
                            playcard(player: currentPlayer)
                            //self.checkWin()
                            break
                        }
                        //                                if widowCards[j].suit == playedCard[playedCard.count - 1].suit && widowCards[j].rank ==  nextCard[0].rank{
                        //                                    currentPlayer = 3
                        //                                    nextCard[0].suit == playedCard[playedCard.count - 1].suit && nextCard[0].rank == playedCard[playedCard.count - 1].rank + 1
                        //                                    flashCurrentPlayer(currentPlayer)
                        //                                    playcard(player: currentPlayer)
                        //                                    //self.checkWin()
                        //                                    break
                        //                                }
                        if MeCards[i].suit == playedCard[playedCard.count - 1].suit && MeCards[i].rank == playedCard[playedCard.count - 1].rank + 1 {
                            currentPlayer = 1
                            flashCurrentPlayer(currentPlayer)
                            playcard(player: currentPlayer)
                            //self.checkWin()
                            break
                            
                            
                            
                        }
                    }
                //                        if player == 3 {
                //                            if widowCards[j].suit == nextCard[0].suit && widowCards[j].rank == nextCard[0].rank{
                //                                if playedCard[playedCard.count - 1].suit == "Spades" && playedCard[playedCard.count - 1].rank == 14 {
                //                                    //                                    switchToRed = true
                //                                    //                                    switchToBlack = false
                //                                }
                //                                if playedCard[playedCard.count - 1].suit == "Spades" && playedCard[playedCard.count - 1].rank == 10 {
                //                                    player2Score += 15
                //                                }
                //                                if playedCard[playedCard.count - 1].suit == "Diamonds" && playedCard[playedCard.count - 1].rank == 11 {
                //                                    player2Score += 15
                //                                }
                //                                currentPlayer = 3
                //                                nextCard[0].suit == playedCard[playedCard.count - 1].suit && nextCard[0].rank == playedCard[playedCard.count - 1].rank + 1
                //                                flashCurrentPlayer(currentPlayer)
                //                                playcard(player: currentPlayer)
                //                                //self.checkWin()
                //                                break
                //                            }else
                //                                if MeCards[i].suit == playedCard[playedCard.count - 1].suit && MeCards[i].rank ==  nextCard[0].rank{
                //                                    currentPlayer = 1
                //                                    nextCard[0].suit == playedCard[playedCard.count - 1].suit && nextCard[0].rank == playedCard[playedCard.count - 1].rank + 1
                //                                    flashCurrentPlayer(currentPlayer)
                //                                    playcard(player: currentPlayer)
                //                                    //self.checkWin()
                //                                    break
                //                                }
                //                                    if player2Cards[k].suit == playedCard[playedCard.count - 1].suit && player2Cards[k].rank ==  nextCard[0].rank {
                //                                        currentPlayer = 2
                //                                        nextCard[0].suit == playedCard[playedCard.count - 1].suit && nextCard[0].rank == playedCard[playedCard.count - 1].rank + 1
                //                                        flashCurrentPlayer(currentPlayer)
                //                                        playcard(player: currentPlayer)
                //                                        //self.checkWin()
                //                                        break
                //                            }
                //                            
                //                        }
            }
        }
                
//                self.checkWin()
//            }
        }
    }
    
    func checkWin() {
        
        if MeCards.count == 0 || player2Cards.count == 0 {
            
            if MeScore >= 10 || player2Score >= 10 { //|| player3Score >= 30 || player4Score >= 30 {
                // Somebody Won the Game
                
                gameInProgress = false
                
                var winner: String = ""
                var score: Int = 0
                
                if MeScore > player2Score {
                    winner = "YOU"
                    score = MeScore
                }else{
                    winner = "Player 2"
                    score = player2Score
                }
                //                if player3Score > score {
                //                    winner = "Player 3"
                //                    score = player3Score
                //                }
                //                if player4Score > score {
                //                    winner = "Player 4"
                //                    score = player4Score
                //                }
                
                let winningLabel = SKLabelNode(fontNamed: "Copperplate-Bold")
                winningLabel.fontSize = 50
                winningLabel.fontColor = SKColor.blackColor()
                winningLabel.text = "\(winner) WON"
                
                winningLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 150)
                self.addChild(winningLabel)
                
                let scaleDown = SKAction.scaleTo(0.1, duration: 0.1)
                let scaleUp = SKAction.scaleTo(1.5, duration: 3.0)
                let scale = SKAction.scaleTo(1, duration: 0.25)
                let sequence = SKAction.sequence([scaleDown, scaleUp, scale])
                
                winningLabel.runAction(sequence, completion: { () -> Void in
                    
                    let restartLabel = SKLabelNode(fontNamed: "Copperplate-Bold")
                    restartLabel.fontSize = 30
                    restartLabel.fontColor = SKColor.blackColor()
                    restartLabel.text = "Touch to Restart"
                    
                    restartLabel.position = CGPointMake(CGRectGetMidX(self.frame), winningLabel.position.y - 30)
                    self.addChild(restartLabel)
                    
                    let fadeOut = SKAction.fadeAlphaTo(0, duration: 0.25)
                    let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 0.25)
                    let sequence = SKAction.sequence([fadeOut, fadeIn])
                    let `repeat` = SKAction.repeatActionForever(sequence)
                    restartLabel.runAction(`repeat`)
                    
                })
                
            }else {
                //Re-Deal the Cards
                
                print("New Hand")
                dealCards()
                //                canPlaySpades = true
                //                canPlayDiamonds = false
                //                canPlayClubs = true
                //                canPlayHearts = false
            }
            
        }else {
            // Next Turn
            
            if self.currentPlayer != 1 {
                playcard(player: currentPlayer)
            }
            
        }
        
    }
    
    func cardType(suit: String) -> CGFloat {
        
        var type: CGFloat = 0
        if suit == "Spades" {
            type = 0
        }else if suit == "Diamonds" {
            type = 13
        }else if suit == "Clubs" {
            type = 26
        }else if suit == "Hearts" {
            type = 39
        }
        return type
    }
    
    func sortCards(playerCards: [Card]) -> [Card] {
        
        var spadeCards = [Card]()
        var diamondCards = [Card]()
        var clubCards = [Card]()
        var heartCards = [Card]()
        
        for i in 0...playerCards.count - 1 {
            
            if playerCards[i].suit == "Spades" {
                spadeCards.append(playerCards[i])
            }else if playerCards[i].suit == "Diamonds" {
                diamondCards.append(playerCards[i])
            }else if playerCards[i].suit == "Clubs" {
                clubCards.append(playerCards[i])
            }else if playerCards[i].suit == "Hearts" {
                heartCards.append(playerCards[i])
            }
        }
        
/*This comment block also works.  Was part of hearts coding
        if spadeCards.count > 1 {
            
            for i in 1...spadeCards.count {
                for j in 0...spadeCards.count - 2 {
                    
                    if spadeCards[j+1].rank < spadeCards[j].rank {
                        
                        let temp = spadeCards[j]
                        spadeCards[j] = spadeCards[j+1]
                        spadeCards[j+1] = temp
                    }
                }
            }
        }
*/
        
        if spadeCards.count > 1 {
            
            for i in 0...spadeCards.count - 1{
                for j in 0...spadeCards.count - 1 {
                    
                    if spadeCards[i].rank < spadeCards[j].rank {
                        
                        let temp = spadeCards[i]
                        spadeCards[i] = spadeCards[j]
                        spadeCards[j] = temp
                    }
                }
            }
        }
        if diamondCards.count > 1 {
            
            for i in 0...diamondCards.count - 1{
                for j in 0...diamondCards.count - 1 {
                    
                    if diamondCards[i].rank < diamondCards[j].rank {
                        
                        let temp = diamondCards[i]
                        diamondCards[i] = diamondCards[j]
                        diamondCards[j] = temp
                    }
                }
            }
        }

        if clubCards.count > 1 {
            
            for i in 0...clubCards.count - 1{
                for j in 0...clubCards.count - 1 {
                    
                    if clubCards[i].rank < clubCards[j].rank {
                        
                        let temp = clubCards[i]
                        clubCards[i] = clubCards[j]
                        clubCards[j] = temp
                    }
                }
            }
        }
        
        if heartCards.count > 1 {
            
            for i in 0...heartCards.count - 1 {
                for j in 0...heartCards.count - 1 {
                    if heartCards[i].rank < heartCards[j].rank {
                        
                        let temp = heartCards[i]
                        heartCards[i] = heartCards[j]
                        heartCards[j] = temp
                    }
                }
            }
        }

        var shuffledplayedCards = [Card]()
        
        if spadeCards.count > 0 {
            for i in 0...spadeCards.count - 1 {
                shuffledplayedCards.append(spadeCards[i])
            }
        }
        if diamondCards.count > 0 {
            for i in 0...diamondCards.count - 1 {
                shuffledplayedCards.append(diamondCards[i])
            }
        }
        if clubCards.count > 0 {
            for i in 0...clubCards.count - 1 {
                shuffledplayedCards.append(clubCards[i])
            }
        }
        if heartCards.count > 0 {
            for i in 0...heartCards.count - 1 {
                shuffledplayedCards.append(heartCards[i])
            }
        }
        return shuffledplayedCards
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            if gameInProgress {
                // Human Player's Move
                
                if let node = nodeAtPoint(location) as? Card {
                    
                    if MeCards.contains(node) && currentPlayer == 1 {
                        
                        if playedCard.count == 0 {
                            
                            if node.suit != "Diamonds" {
                                moveCard(node: node, player: self.currentPlayer)
                            }else {
                                var hasOtherLowerCards: Bool = false
                                for i in 0...self.MeCards.count - 1 {
                                    if MeCards[i].suit != "Diamonds" {
                                        hasOtherLowerCards = true
                                        break
                                    }
                                }
                                if hasOtherLowerCards {
                                    displayMessage(msg: "Play Lowest Black Card")
                                }else {
                                    moveCard(node: node, player: self.currentPlayer)
                                    
                                }
                            }
                            
                        }else {
                            
                            var hasPlayingSuit: Bool = false
                            
                            for card in MeCards {
                                if card.suit == playedCard[playedCard.count - 1].suit {
                                    hasPlayingSuit = true
                                    break
                                }
                            }
                            if switchToRed == false {
                                if node.suit == playedCard[playedCard.count - 1].suit {
                                    if playedCard[playedCard.count - 1].suit == "Spades" || playedCard[playedCard.count - 1].suit == "Clubs" && playedCard[playedCard.count - 1].rank + 1 == 15 {
                                        switchToRed = true
                                        switchToBlack = false
                                    }
                                    moveCard(node: node, player: self.currentPlayer)
                                }else {
                                    displayMessage(msg: "You Can't Play This Suit Yet")
                                }
                            }else {
                                if playedCard[playedCard.count - 1].suit == "Spades" || playedCard[playedCard.count - 1].suit == "Clubs" && playedCard[playedCard.count - 1].rank + 1 == 15 {
                                    switchToRed = true
                                    switchToBlack = false
                                }
                                moveCard(node: node, player: self.currentPlayer)
                            }
                        }
                    }
                }
                
            }else {
                // Restart Player's Move
                let scene = GameScene(size: self.frame.size)
                self.view?.presentScene(scene)
            }
        }
    }
    
    //Helper Methods for Artificial Intelligence
    
    func getSmallestOrBiggestCard(cards: [Card], whichOne: String) -> Card {
        
        var returnCard: Card = cards[0]
        if cards.count > 1 {
            
            for i in 1...cards.count - 1 {
                if whichOne == "smallest" {
                    if cards[i].rank < returnCard.rank {
                        returnCard = cards[i]
                        
                    }
                }else {
                    if cards[i].rank > returnCard.rank {
                        returnCard = cards[i]
                    }
                }
            }
        }
        return returnCard
        
    }
    
    func biggestOfPlayingCards() -> Card {
        
        var playingSuitCards = [Card]()
        if playedCard.count > 1 {
            playingSuitCards.append(playedCard[0])
            for i in 1...playedCard.count - 1 {
                if playedCard[i].suit == playedCard[0].suit {
                    playingSuitCards.append(playedCard[i])
                }
            }
            
            let biggest = getSmallestOrBiggestCard(playingSuitCards, whichOne: "biggest")
            return biggest
            
        }else {
            playingSuitCards.append(playedCard[0])
            return playingSuitCards[0]
        }
        
    }
    
    func haveSmallerOrBiggerCard(cards: [Card], rankToCompare : Int, whichOne: String) -> Bool {
        
        if whichOne == "bigger" {
            for card in cards {
                if card.rank + 1 == rankToCompare {
                    return true
                    
                }
            }
        }else {
            for card in cards {
                if card.rank + 1 != rankToCompare {
                    return false
                }
            }
        }
        return false
    }

    func getSmallerOrBiggerCards(cards: [Card], rankToCompare: Int, whichOne: String) -> Card {
        
        var smallerOrBiggerCards = [Card]()
        
        if haveSmallerOrBiggerCard(cards, rankToCompare: rankToCompare, whichOne: whichOne) {
            for card in cards {
                if whichOne == "bigger" {
                    if card.rank > rankToCompare {
                        smallerOrBiggerCards.append(card)
                        
                    }
                }else {
                    if card.rank < rankToCompare {
                        smallerOrBiggerCards.append(card)
                    }
                }
            }
            
            var returnCard: Card
            if whichOne == "smaller" {
                returnCard = getSmallestOrBiggestCard(smallerOrBiggerCards, whichOne: "biggest")
            }else {
                returnCard = getSmallestOrBiggestCard(smallerOrBiggerCards, whichOne: "smallest")
            }
            return returnCard
        }else {
            for card in cards {
                if whichOne == "smaller" {
                    if card.rank > rankToCompare {
                        smallerOrBiggerCards.append(card)
                    }
                }else {
                    if card.rank < rankToCompare {
                        smallerOrBiggerCards.append(card)
                    }
                }
            }
            var returnCard: Card
            if whichOne == "smaller" {
                returnCard = getSmallestOrBiggestCard(smallerOrBiggerCards, whichOne: "smallest")
            }else {
                returnCard = getSmallestOrBiggestCard(smallerOrBiggerCards, whichOne: "biggest")
            }
            return returnCard
        }
        
        
    }
    
    //    func haveTenSpades(cards: [Card]) -> Bool {
    //
    //        for card in cards {
    //            if card.rank == 10 && card.suit == "Spades" {
    //                return true
    //            }
    //        }
    //        return false
    //    }
    //    func haveJackDiamonds(cards: [Card]) -> Bool {
    //
    //        for card in cards {
    //            if card.rank == 11 && card.suit == "Diamonds" {
    //                return true
    //            }
    //        }
    //        return false
    //    }
    //    func haveQueenClubs(cards: [Card]) -> Bool {
    //
    //        for card in cards {
    //            if card.rank == 12 && card.suit == "Clubs" {
    //                return true
    //            }
    //        }
    //        return false
    //    }
    //    func haveKingHearts(cards: [Card]) -> Bool {
    //
    //        for card in cards {
    //            if card.rank == 13 && card.suit == "Hearts" {
    //                return true
    //            }
    //        }
    //        return false
    //    }
    //    func haveAceSpades(cards: [Card]) -> Bool {
    //
    //        for card in cards {
    //            if card.rank == 14 && card.suit == "Spades" {
    //                return true
    //            }
    //        }
    //        return false
    //    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        //displayMessage(msg: "You Touched the Screen")
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if let node = nodeAtPoint(location) as? Card {
                node.flip()
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
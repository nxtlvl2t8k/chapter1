//import SpriteKit
//
//class Hearts: SKScene {
//    
//    var suits = [String]()
//    var deck = [Card]()
//    
//    var MeCards = [Card]()
//    var player2Cards = [Card]()
//    var player3Cards = [Card]()
//    var player4Cards = [Card]()
//    //    var player5Cards = [Card]()
//    //    var player6Cards = [Card]()
//    //    var player7Cards = [Card]()
//    //    var player8Cards = [Card]()
//    //    var player9Cards = [Card]()
//    //    var dummyplayerCards = [Card]()
//    
//    var MeCardPositions = [CGPoint]()
//    var player2CardPositions = [CGPoint]()
//    var player3CardPositions = [CGPoint]()
//    var player4CardPositions = [CGPoint]()
//    //    var player5CardPositions = [CGPoint]()
//    //    var player6CardPositions = [CGPoint]()
//    //    var player7CardPositions = [CGPoint]()
//    //    var player8CardPositions = [CGPoint]()
//    //    var player9CardPositions = [CGPoint]()
//    //    var dummyCardPositions = [CGPoint]()
//    
//    let cardOffset: CGFloat = 25
//    let sides: CGFloat = 30
//    
//    var MePlayingPosition = CGPoint()
//    var MePlayingCard = [Card]()
//    var player2PlayingPosition = CGPoint()
//    var player2PlayingCard = [Card]()
//    var player3PlayingPosition = CGPoint()
//    var player3PlayingCard = [Card]()
//    var player4PlayingPosition = CGPoint()
//    var player4PlayingCard = [Card]()
//    //    var player5PlayingPosition = CGPoint()
//    //    var player5PlayingCard = [Card]()
//    //    var player6PlayingPosition = CGPoint()
//    //    var player6PlayingCard = [Card]()
//    //    var player7PlayingPosition = CGPoint()
//    //    var player7PlayingCard = [Card]()
//    //    var player8PlayingPosition = CGPoint()
//    //    var player8PlayingCard = [Card]()
//    //    var player9PlayingPosition = CGPoint()
//    //    var player9PlayingCard = [Card]()
//    //    var dummyPlayingPosition = CGPoint()
//    //    var dummyPlayingCard = [Card]()
//    
//    var currentMoveCards = [Card]()
//    
//    var MeLabel = SKLabelNode()
//    var player2Label = SKLabelNode()
//    var player3Label = SKLabelNode()
//    var player4Label = SKLabelNode()
//    //    var player5Label = SKLabelNode()
//    //    var player6Label = SKLabelNode()
//    //    var player7Label = SKLabelNode()
//    //    var player8Label = SKLabelNode()
//    //    var player9Label = SKLabelNode()
//    
//    var MeScoreLabel = SKLabelNode()
//    var player2ScoreLabel = SKLabelNode()
//    var player3ScoreLabel = SKLabelNode()
//    var player4ScoreLabel = SKLabelNode()
//    //    var player5ScoreLabel = SKLabelNode()
//    //    var player6ScoreLabel = SKLabelNode()
//    //    var player7ScoreLabel = SKLabelNode()
//    //    var player8ScoreLabel = SKLabelNode()
//    //    var player9ScoreLabel = SKLabelNode()
//    
//    var MeScore: Int = 0
//    var player2Score: Int = 0
//    var player3Score: Int = 0
//    var player4Score: Int = 0
//    //    var player5Score: Int = 0
//    //    var player6Score: Int = 0
//    //    var player7Score: Int = 0
//    //    var player8Score: Int = 0
//    //    var player9Score: Int = 0
//    
//    var currentPlayer: Int = 0
//    var gameInProgress: Bool = false
//    //    var canPlaySpades: Bool = false
//    //    var canPlayDiamonds: Bool = false
//    //    var canPlayClubs: Bool = false
//    var canPlayHearts: Bool = false
//    
//    override init(size:CGSize){
//        super.init(size: size)
//        
//        self.backgroundColor = SKColor.greenColor()
//        self.suits = ["Spades","Hearts","Clubs","Diamonds"]
//        
//        // Testing by placing a card in the middle
//        // let texture = SKTexture(imageNamed: "Clubs_5")
//        // let card = SKSpriteNode(texture: texture)
//        // card.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
//        // self.addChild(card)
//        
//        // let card:Card = Card(rank: 7, suit: "Spades", faceUp: false)
//        // card.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
//        // self.addChild(card)
//        
//        dealCards()
//        
//        let centerCard = SKSpriteNode(imageNamed: "Back")
//        //centerCard.position = CGPointMake(CGRectGetMinX(self.frame) + 40, CGRectGetMidY(self.frame) + 50)
//        centerCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
//        self.addChild(centerCard)
//        
//        //Me
//        let newX1 = centerCard.position.x
//        let newY1 = centerCard.position.y //centerCard.position.y - centerCard.size.height/2 - cardOffset - centerCard.size.height/2
//        MePlayingPosition = CGPoint(x: newX1, y: newY1)
//        //Player2
//        let newX2 = centerCard.position.x
//        let newY2 = centerCard.position.y //centerCard.position.y - centerCard.size.height/2 + cardOffset + centerCard.size.height/2
//        player2PlayingPosition = CGPoint(x: newX2, y: newY2)
//        //Player3
//        let newX3 = centerCard.position.x
//        let newY3 = centerCard.position.y //centerCard.position.y - centerCard.size.height/2 + cardOffset + centerCard.size.height/2
//        player3PlayingPosition = CGPoint(x: newX3, y: newY3)
//        //Player4
//        let newX4 = centerCard.position.x
//        let newY4 = centerCard.position.y //centerCard.position.y - centerCard.size.height/2 + cardOffset + centerCard.size.height/2
//        player4PlayingPosition = CGPoint(x: newX4, y: newY4)
//        
//        MeLabel = SKLabelNode(fontNamed: "HelveticaNeue_Bold")
//        MeLabel.fontColor = SKColor.brownColor()
//        MeLabel.fontSize = 40
//        MeLabel.text = "You"
//        
//        MeLabel.position = CGPointMake(CGRectGetMidX(self.frame) - MeLabel.frame.width/2, sides/2 - MeLabel.frame.height/2)
//        self.addChild(MeLabel)
//        
//        player2Label = SKLabelNode(fontNamed: "HelveticaNeue_Bold")
//        player2Label.fontColor = SKColor.brownColor()
//        player2Label.fontSize = 40
//        player2Label.text = "2"
//        
//        player2Label.position = CGPointMake(sides/2, CGRectGetMidY(self.frame) + player2Label.frame.width/2)
//        self.addChild(player2Label)
//        
//        player3Label = SKLabelNode(fontNamed: "HelveticaNeue_Bold")
//        player3Label.fontColor = SKColor.brownColor()
//        player3Label.fontSize = 40
//        player3Label.text = "3"
//        
//        player3Label.position = CGPointMake(CGRectGetMidX(self.frame) - player3Label.frame.width/2, self.frame.height - sides/2 - player3Label.frame.height/2)
//        self.addChild(player3Label)
//        
//        player4Label = SKLabelNode(fontNamed: "HelveticaNeue_Bold")
//        player4Label.fontColor = SKColor.brownColor()
//        player4Label.fontSize = 40
//        player4Label.text = "4"
//        
//        player4Label.position = CGPointMake(self.frame.width - sides/2, CGRectGetMidY(self.frame) + player4Label.frame.height/2)
//        self.addChild(player4Label)
//        
//        //Score Label Nodes
//        MeScoreLabel = SKLabelNode(fontNamed: "Courier-Bold")
//        player2ScoreLabel = SKLabelNode(fontNamed: "Courier-Bold")
//        player3ScoreLabel = SKLabelNode(fontNamed: "Courier-Bold")
//        player4ScoreLabel = SKLabelNode(fontNamed: "Courier-Bold")
//        
//        MeScoreLabel.fontSize = 20
//        player2ScoreLabel.fontSize = 20
//        player3ScoreLabel.fontSize = 20
//        player4ScoreLabel.fontSize = 20
//        
//        MeScoreLabel.text = "Score:\(MeScore)"
//        player2ScoreLabel.text = "Score:\(player2Score)"
//        player3ScoreLabel.text = "Score:\(player3Score)"
//        player4ScoreLabel.text = "Score:\(player4Score)"
//        
//        MeScoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), sides + centerCard.frame.height + 20)
//        player2ScoreLabel.position = CGPointMake(sides + centerCard.frame.width + cardOffset + player2ScoreLabel.frame.width/2, CGRectGetMidY(self.frame))
//        player3ScoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.size.height - sides - centerCard.size.height - cardOffset - player3ScoreLabel.frame.height/2)
//        player4ScoreLabel.position = CGPointMake(self.size.width - sides - centerCard.size.width - player4ScoreLabel.frame.width/2 - 20, CGRectGetMidY(self.frame))
//        
//        self.addChild(MeScoreLabel)
//        self.addChild(player2ScoreLabel)
//        self.addChild(player3ScoreLabel)
//        self.addChild(player4ScoreLabel)
//        
//        //        //Testing Helper Method
//        //        var testCards = [Card]()
//        //
//        //        let card1 = Card(rank: 3, suit: "Spades", faceUp: false)
//        //        let card2 = Card(rank: 5, suit: "Spades", faceUp: false)
//        //        let card3 = Card(rank: 9, suit: "Spades", faceUp: false)
//        //        let card4 = Card(rank: 12, suit: "Spades", faceUp: false)
//        //        let card5 = Card(rank: 13, suit: "Spades", faceUp: false)
//        //
//        //        testCards.append(card1)
//        //        testCards.append(card2)
//        //        testCards.append(card3)
//        //        testCards.append(card4)
//        //        testCards.append(card5)
//        //
//        //        //let anotherCard = getSmallestOrBiggestCard(testCards, whichOne: "smallest")
//        //println(anotherCard.rank)
//        
//        
//        
//    }
//    
//    func playcard(player player: Int) {
//        
//        if player == 2 {
//            
//            var player2SpadeCards = [Card]()
//            var player2HeartCards = [Card]()
//            var player2ClubCards = [Card]()
//            var player2DiamondCards = [Card]()
//            
//            for card in player2Cards {
//                if card.suit == "Spades" {
//                    player2SpadeCards.append(card)
//                }else if card.suit == "Hearts" {
//                    player2HeartCards.append(card)
//                }else if card.suit == "Clubs" {
//                    player2ClubCards.append(card)
//                }else if card.suit == "Diamonds" {
//                    player2DiamondCards.append(card)
//                }
//            }
//            
//            if currentMoveCards.count == 0 {
//                if canPlayHearts == true {
//                    if player2HeartCards.count > 0 {
//                        player2PlayingCard.append(getSmallestOrBiggestCard(player2HeartCards, whichOne: "smallest"))
//                    }else {
//                        if player2DiamondCards.count > 0 {
//                            player2PlayingCard.append(getSmallestOrBiggestCard(player2DiamondCards, whichOne: "smallest"))
//                        }else if player2ClubCards.count > 0 {
//                            player2PlayingCard.append(getSmallestOrBiggestCard(player2ClubCards, whichOne: "smallest"))
//                        }else if player2SpadeCards.count > 0 {
//                            player2PlayingCard.append(getSmallestOrBiggestCard(player2SpadeCards, whichOne: "smallest"))
//                            if player2PlayingCard[0].rank == 12 && player2SpadeCards.count > 1 {
//                                player2PlayingCard[0] = getSmallerOrBiggerCards(player2SpadeCards, rankToCompare: 12, whichOne: "bigger")
//                            }
//                        }
//                    }
//                }else {
//                    if player2DiamondCards.count > 0 {
//                        player2PlayingCard.append(getSmallestOrBiggestCard(player2DiamondCards, whichOne: "smallest"))
//                    }else if player2ClubCards.count > 0 {
//                        player2PlayingCard.append(getSmallestOrBiggestCard(player2ClubCards, whichOne: "smallest"))
//                    }else if player2SpadeCards.count > 0 {
//                        player2PlayingCard.append(getSmallestOrBiggestCard(player2SpadeCards, whichOne: "smallest"))
//                        if player2PlayingCard[0].rank == 12 && player2SpadeCards.count > 1 {
//                            player2PlayingCard[0] = getSmallerOrBiggerCards(player2SpadeCards, rankToCompare: 12, whichOne: "bigger")
//                        }
//                    }else if player2HeartCards.count > 0 {
//                        player2PlayingCard.append(getSmallestOrBiggestCard(player2HeartCards, whichOne: "smallest"))
//                        canPlayHearts = true
//                    }
//                }
//            }else{
//                
//                if currentMoveCards[0].suit == "Spades" {
//                    if player2SpadeCards.count > 0 {
//                        if haveBlackQueen(player2SpadeCards) {
//                            var queenCanBePlayed: Bool = false
//                            for card in currentMoveCards {
//                                if card.rank > 12 && card.suit == "Spades" {
//                                    queenCanBePlayed = true
//                                    break
//                                }
//                            }
//                            if queenCanBePlayed {
//                                for card in player2SpadeCards {
//                                    if card.rank == 12 {
//                                        player2PlayingCard.append(card)
//                                        break
//                                    }
//                                }
//                            }else{
//                                player2PlayingCard.append(getSmallerOrBiggerCards(player2SpadeCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                            }
//                        }else{
//                            player2PlayingCard.append(getSmallerOrBiggerCards(player2SpadeCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                        }
//                    }else{
//                        if canPlayHearts {
//                            if player2HeartCards.count > 0 {
//                                player2PlayingCard.append(getSmallestOrBiggestCard(player2HeartCards, whichOne: "biggest"))
//                            }else if player2ClubCards.count > 0 {
//                                player2PlayingCard.append(getSmallestOrBiggestCard(player2ClubCards, whichOne: "biggest"))
//                            }else if player2DiamondCards.count > 0 {
//                                player2PlayingCard.append(getSmallestOrBiggestCard(player2DiamondCards, whichOne: "biggest"))
//                                
//                            }
//                        }else{
//                            if player2HeartCards.count > 0 {
//                                player2PlayingCard.append(getSmallestOrBiggestCard(player2HeartCards, whichOne: "biggest"))
//                                canPlayHearts = true
//                            }else if player2ClubCards.count > 0 {
//                                player2PlayingCard.append(getSmallestOrBiggestCard(player2ClubCards, whichOne: "biggest"))
//                            }else if player2DiamondCards.count > 0 {
//                                player2PlayingCard.append(getSmallestOrBiggestCard(player2DiamondCards, whichOne: "biggest"))
//                            }
//                        }
//                    }
//                }else if currentMoveCards[0].suit == "Hearts" {
//                    if player2HeartCards.count > 0 {
//                        player2PlayingCard.append(getSmallerOrBiggerCards(player2HeartCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                    }else{
//                        if player2SpadeCards.count > 0 {
//                            if haveBlackQueen(player2SpadeCards) {
//                                for card in player2SpadeCards {
//                                    if card.rank > 12 {
//                                        player2PlayingCard.append(card)
//                                        break
//                                    }
//                                }
//                            }else{
//                                player2PlayingCard.append(getSmallestOrBiggestCard(player2SpadeCards, whichOne: "biggest"))
//                            }
//                        }else if player2ClubCards.count > 0 {
//                            player2PlayingCard.append(getSmallestOrBiggestCard(player2ClubCards, whichOne: "biggest"))
//                        }else if player2DiamondCards.count > 0 {
//                            player2PlayingCard.append(getSmallestOrBiggestCard(player2DiamondCards, whichOne: "biggest"))
//                        }
//                    }
//                }else if currentMoveCards[0].suit == "Clubs" {
//                    if player2ClubCards.count > 0 {
//                        player2PlayingCard.append(getSmallerOrBiggerCards(player2ClubCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                    }else{
//                        if haveBlackQueen(player2SpadeCards) {
//                            for card in player2SpadeCards {
//                                if card.rank > 12 {
//                                    player2PlayingCard.append(card)
//                                    break
//                                }
//                            }
//                        }else{
//                            if canPlayHearts {
//                                if player2HeartCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2HeartCards, whichOne: "biggest"))
//                                }else if player2SpadeCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2SpadeCards,  whichOne: "biggest"))
//                                }else if player2DiamondCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2DiamondCards, whichOne: "biggest"))
//                                }
//                            }else{
//                                if player2HeartCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2HeartCards, whichOne: "biggest"))
//                                    canPlayHearts = true
//                                }else if player2SpadeCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2SpadeCards, whichOne: "biggest"))
//                                }else if player2DiamondCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2DiamondCards, whichOne: "biggest"))
//                                }
//                            }
//                        }
//                    }
//                }else if currentMoveCards[0].suit == "Diamonds" {
//                    if player2DiamondCards.count > 0 {
//                        player2PlayingCard.append(getSmallerOrBiggerCards(player2DiamondCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                    }else{
//                        if haveBlackQueen(player2SpadeCards) {
//                            for card in player2SpadeCards {
//                                if card.rank > 12 {
//                                    player2PlayingCard.append(card)
//                                    break
//                                }
//                            }
//                        }else{
//                            if canPlayHearts {
//                                if player2HeartCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2HeartCards, whichOne: "biggest"))
//                                }else if player2SpadeCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2SpadeCards, whichOne: "biggest"))
//                                }else if player2ClubCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2ClubCards, whichOne: "biggest"))
//                                    
//                                }
//                            }else{
//                                if player2HeartCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2HeartCards, whichOne: "biggest"))
//                                    canPlayHearts = true
//                                }else if player2SpadeCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2SpadeCards, whichOne: "biggest"))
//                                }else if player2ClubCards.count > 0 {
//                                    player2PlayingCard.append(getSmallestOrBiggestCard(player2ClubCards, whichOne: "biggest"))
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            moveCard(node: player2PlayingCard[0], player: self.currentPlayer)
//
//        }else if player == 3 {
//            
//            var player3SpadeCards = [Card]()
//            var player3HeartCards = [Card]()
//            var player3ClubCards = [Card]()
//            var player3DiamondCards = [Card]()
//            
//            for card in player3Cards {
//                if card.suit == "Spades" {
//                    player3SpadeCards.append(card)
//                }else if card.suit == "Hearts" {
//                    player3HeartCards.append(card)
//                }else if card.suit == "Clubs" {
//                    player3ClubCards.append(card)
//                }else if card.suit == "Diamonds" {
//                    player3DiamondCards.append(card)
//                }
//            }
//            if currentMoveCards.count == 0 {
//                if canPlayHearts == true {
//                    if player3HeartCards.count > 0 {
//                        player3PlayingCard.append(getSmallestOrBiggestCard(player3HeartCards, whichOne: "smallest"))
//                    }else {
//                        if player3DiamondCards.count > 0 {
//                            player3PlayingCard.append(getSmallestOrBiggestCard(player3DiamondCards, whichOne: "smallest"))
//                        }else if player3ClubCards.count > 0 {
//                            player3PlayingCard.append(getSmallestOrBiggestCard(player3ClubCards, whichOne: "smallest"))
//                        }else if player3SpadeCards.count > 0 {
//                            player3PlayingCard.append(getSmallestOrBiggestCard(player3SpadeCards, whichOne: "smallest"))
//                            if player3PlayingCard[0].rank == 12 && player3SpadeCards.count > 1 {
//                                player3PlayingCard[0] = getSmallerOrBiggerCards(player3SpadeCards, rankToCompare: 12, whichOne: "bigger")
//                            }
//                        }
//                    }
//                }else {
//                    if player3DiamondCards.count > 0 {
//                        player3PlayingCard.append(getSmallestOrBiggestCard(player3DiamondCards, whichOne: "smallest"))
//                    }else if player3ClubCards.count > 0 {
//                        player3PlayingCard.append(getSmallestOrBiggestCard(player3ClubCards, whichOne: "smallest"))
//                    }else if player3SpadeCards.count > 0 {
//                        player3PlayingCard.append(getSmallestOrBiggestCard(player3SpadeCards, whichOne: "smallest"))
//                        if player3PlayingCard[0].rank == 12 && player3SpadeCards.count > 1 {
//                            player3PlayingCard[0] = getSmallerOrBiggerCards(player3SpadeCards, rankToCompare: 12, whichOne: "bigger")
//                        }
//                    }else if player3HeartCards.count > 0 {
//                        player3PlayingCard.append(getSmallestOrBiggestCard(player3HeartCards, whichOne: "smallest"))
//                        canPlayHearts = true
//                    }
//                }
//            }else{
//                
//                if currentMoveCards[0].suit == "Spades" {
//                    if player3SpadeCards.count > 0 {
//                        if haveBlackQueen(player3SpadeCards) {
//                            var queenCanBePlayed: Bool = false
//                            for card in currentMoveCards {
//                                if card.rank > 12 && card.suit == "Spades" {
//                                    queenCanBePlayed = true
//                                    break
//                                }
//                            }
//                            if queenCanBePlayed {
//                                for card in player3SpadeCards {
//                                    if card.rank == 12 {
//                                        player3PlayingCard.append(card)
//                                        break
//                                    }
//                                }
//                            }else{
//                                player3PlayingCard.append(getSmallerOrBiggerCards(player3SpadeCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                            }
//                        }else{
//                            player3PlayingCard.append(getSmallerOrBiggerCards(player3SpadeCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                        }
//                    }else{
//                        if canPlayHearts {
//                            if player3HeartCards.count > 0 {
//                                player3PlayingCard.append(getSmallestOrBiggestCard(player3HeartCards, whichOne: "biggest"))
//                            }else if player3ClubCards.count > 0 {
//                                player3PlayingCard.append(getSmallestOrBiggestCard(player3ClubCards, whichOne: "biggest"))
//                            }else if player3DiamondCards.count > 0 {
//                                player3PlayingCard.append(getSmallestOrBiggestCard(player3DiamondCards, whichOne: "biggest"))
//                                
//                            }
//                        }else{
//                            if player3HeartCards.count > 0 {
//                                player3PlayingCard.append(getSmallestOrBiggestCard(player3HeartCards, whichOne: "biggest"))
//                                canPlayHearts = true
//                            }else if player3ClubCards.count > 0 {
//                                player3PlayingCard.append(getSmallestOrBiggestCard(player3ClubCards, whichOne: "biggest"))
//                            }else if player3DiamondCards.count > 0 {
//                                player3PlayingCard.append(getSmallestOrBiggestCard(player3DiamondCards, whichOne: "biggest"))
//                            }
//                        }
//                    }
//                }else if currentMoveCards[0].suit == "Hearts" {
//                    if player3HeartCards.count > 0 {
//                        player3PlayingCard.append(getSmallerOrBiggerCards(player3HeartCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                    }else{
//                        if player3SpadeCards.count > 0 {
//                            if haveBlackQueen(player3SpadeCards) {
//                                for card in player3SpadeCards {
//                                    if card.rank > 12 {
//                                        player3PlayingCard.append(card)
//                                        break
//                                    }
//                                }
//                            }else{
//                                player3PlayingCard.append(getSmallestOrBiggestCard(player3SpadeCards, whichOne: "biggest"))
//                            }
//                        }else if player3ClubCards.count > 0 {
//                            player3PlayingCard.append(getSmallestOrBiggestCard(player3ClubCards, whichOne: "biggest"))
//                        }else if player3DiamondCards.count > 0 {
//                            player3PlayingCard.append(getSmallestOrBiggestCard(player3DiamondCards, whichOne: "biggest"))
//                        }
//                    }
//                }else if currentMoveCards[0].suit == "Clubs" {
//                    if player3ClubCards.count > 0 {
//                        player3PlayingCard.append(getSmallerOrBiggerCards(player3ClubCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                    }else{
//                        if haveBlackQueen(player3SpadeCards) {
//                            for card in player3SpadeCards {
//                                if card.rank > 12 {
//                                    player3PlayingCard.append(card)
//                                    break
//                                }
//                            }
//                        }else{
//                            if canPlayHearts {
//                                if player3HeartCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3HeartCards, whichOne: "biggest"))
//                                }else if player3SpadeCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3SpadeCards,  whichOne: "biggest"))
//                                }else if player3DiamondCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3DiamondCards, whichOne: "biggest"))
//                                }
//                            }else{
//                                if player3HeartCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3HeartCards, whichOne: "biggest"))
//                                    canPlayHearts = true
//                                }else if player3SpadeCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3SpadeCards, whichOne: "biggest"))
//                                }else if player3DiamondCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3DiamondCards, whichOne: "biggest"))
//                                }
//                            }
//                        }
//                    }
//                }else if currentMoveCards[0].suit == "Diamonds" {
//                    if player3DiamondCards.count > 0 {
//                        player3PlayingCard.append(getSmallerOrBiggerCards(player3DiamondCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                    }else{
//                        if haveBlackQueen(player3SpadeCards) {
//                            for card in player3SpadeCards {
//                                if card.rank > 12 {
//                                    player3PlayingCard.append(card)
//                                    break
//                                }
//                            }
//                        }else{
//                            if canPlayHearts {
//                                if player3HeartCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3HeartCards, whichOne: "biggest"))
//                                }else if player3SpadeCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3SpadeCards, whichOne: "biggest"))
//                                }else if player3ClubCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3ClubCards, whichOne: "biggest"))
//                                    
//                                }
//                            }else{
//                                if player3HeartCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3HeartCards, whichOne: "biggest"))
//                                    canPlayHearts = true
//                                }else if player3SpadeCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3SpadeCards, whichOne: "biggest"))
//                                }else if player3ClubCards.count > 0 {
//                                    player3PlayingCard.append(getSmallestOrBiggestCard(player3ClubCards, whichOne: "biggest"))
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            moveCard(node: player3PlayingCard[0], player: self.currentPlayer)
//            
//        }else if player == 4 {
//            
//            var player4SpadeCards = [Card]()
//            var player4HeartCards = [Card]()
//            var player4ClubCards = [Card]()
//            var player4DiamondCards = [Card]()
//            
//            for card in player4Cards {
//                if card.suit == "Spades" {
//                    player4SpadeCards.append(card)
//                }else if card.suit == "Hearts" {
//                    player4HeartCards.append(card)
//                }else if card.suit == "Clubs" {
//                    player4ClubCards.append(card)
//                }else if card.suit == "Diamonds" {
//                    player4DiamondCards.append(card)
//                }
//            }
//            if currentMoveCards.count == 0 {
//                if canPlayHearts == true {
//                    if player4HeartCards.count > 0 {
//                        player4PlayingCard.append(getSmallestOrBiggestCard(player4HeartCards, whichOne: "smallest"))
//                    }else {
//                        if player4DiamondCards.count > 0 {
//                            player4PlayingCard.append(getSmallestOrBiggestCard(player4DiamondCards, whichOne: "smallest"))
//                        }else if player4ClubCards.count > 0 {
//                            player4PlayingCard.append(getSmallestOrBiggestCard(player4ClubCards, whichOne: "smallest"))
//                        }else if player4SpadeCards.count > 0 {
//                            player4PlayingCard.append(getSmallestOrBiggestCard(player4SpadeCards, whichOne: "smallest"))
//                            if player4PlayingCard[0].rank == 12 && player4SpadeCards.count > 1 {
//                                player4PlayingCard[0] = getSmallerOrBiggerCards(player4SpadeCards, rankToCompare: 12, whichOne: "bigger")
//                            }
//                        }
//                    }
//                }else {
//                    if player4DiamondCards.count > 0 {
//                        player4PlayingCard.append(getSmallestOrBiggestCard(player4DiamondCards, whichOne: "smallest"))
//                    }else if player4ClubCards.count > 0 {
//                        player4PlayingCard.append(getSmallestOrBiggestCard(player4ClubCards, whichOne: "smallest"))
//                    }else if player4SpadeCards.count > 0 {
//                        player4PlayingCard.append(getSmallestOrBiggestCard(player4SpadeCards, whichOne: "smallest"))
//                        if player4PlayingCard[0].rank == 12 && player4SpadeCards.count > 1 {
//                            player4PlayingCard[0] = getSmallerOrBiggerCards(player4SpadeCards, rankToCompare: 12, whichOne: "bigger")
//                        }
//                    }else if player4HeartCards.count > 0 {
//                        player4PlayingCard.append(getSmallestOrBiggestCard(player4HeartCards, whichOne: "smallest"))
//                        canPlayHearts = true
//                    }
//                }
//            }else{
//                
//                if currentMoveCards[0].suit == "Spades" {
//                    if player4SpadeCards.count > 0 {
//                        if haveBlackQueen(player4SpadeCards) {
//                            var queenCanBePlayed: Bool = false
//                            for card in currentMoveCards {
//                                if card.rank > 12 && card.suit == "Spades" {
//                                    queenCanBePlayed = true
//                                    break
//                                }
//                            }
//                            if queenCanBePlayed {
//                                for card in player4SpadeCards {
//                                    if card.rank == 12 {
//                                        player4PlayingCard.append(card)
//                                        break
//                                    }
//                                }
//                            }else{
//                                player4PlayingCard.append(getSmallerOrBiggerCards(player4SpadeCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                            }
//                        }else{
//                            player4PlayingCard.append(getSmallerOrBiggerCards(player4SpadeCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                        }
//                    }else{
//                        if canPlayHearts {
//                            if player4HeartCards.count > 0 {
//                                player4PlayingCard.append(getSmallestOrBiggestCard(player4HeartCards, whichOne: "biggest"))
//                            }else if player4ClubCards.count > 0 {
//                                player4PlayingCard.append(getSmallestOrBiggestCard(player4ClubCards, whichOne: "biggest"))
//                            }else if player4DiamondCards.count > 0 {
//                                player4PlayingCard.append(getSmallestOrBiggestCard(player4DiamondCards, whichOne: "biggest"))
//                                
//                            }
//                        }else{
//                            if player4HeartCards.count > 0 {
//                                player4PlayingCard.append(getSmallestOrBiggestCard(player4HeartCards, whichOne: "biggest"))
//                                canPlayHearts = true
//                            }else if player4ClubCards.count > 0 {
//                                player4PlayingCard.append(getSmallestOrBiggestCard(player4ClubCards, whichOne: "biggest"))
//                            }else if player4DiamondCards.count > 0 {
//                                player4PlayingCard.append(getSmallestOrBiggestCard(player4DiamondCards, whichOne: "biggest"))
//                            }
//                        }
//                    }
//                }else if currentMoveCards[0].suit == "Hearts" {
//                    if player4HeartCards.count > 0 {
//                        player4PlayingCard.append(getSmallerOrBiggerCards(player4HeartCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                    }else{
//                        if player4SpadeCards.count > 0 {
//                            if haveBlackQueen(player4SpadeCards) {
//                                for card in player4SpadeCards {
//                                    if card.rank > 12 {
//                                        player4PlayingCard.append(card)
//                                        break
//                                    }
//                                }
//                            }else{
//                                player4PlayingCard.append(getSmallestOrBiggestCard(player4SpadeCards, whichOne: "biggest"))
//                            }
//                        }else if player4ClubCards.count > 0 {
//                            player4PlayingCard.append(getSmallestOrBiggestCard(player4ClubCards, whichOne: "biggest"))
//                        }else if player4DiamondCards.count > 0 {
//                            player4PlayingCard.append(getSmallestOrBiggestCard(player4DiamondCards, whichOne: "biggest"))
//                        }
//                    }
//                }else if currentMoveCards[0].suit == "Clubs" {
//                    if player4ClubCards.count > 0 {
//                        player4PlayingCard.append(getSmallerOrBiggerCards(player4ClubCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                    }else{
//                        if haveBlackQueen(player4SpadeCards) {
//                            for card in player4SpadeCards {
//                                if card.rank > 12 {
//                                    player4PlayingCard.append(card)
//                                    break
//                                }
//                            }
//                        }else{
//                            if canPlayHearts {
//                                if player4HeartCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4HeartCards, whichOne: "biggest"))
//                                }else if player4SpadeCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4SpadeCards,  whichOne: "biggest"))
//                                }else if player4DiamondCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4DiamondCards, whichOne: "biggest"))
//                                }
//                            }else{
//                                if player4HeartCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4HeartCards, whichOne: "biggest"))
//                                    canPlayHearts = true
//                                }else if player4SpadeCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4SpadeCards, whichOne: "biggest"))
//                                }else if player4DiamondCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4DiamondCards, whichOne: "biggest"))
//                                }
//                            }
//                        }
//                    }
//                }else if currentMoveCards[0].suit == "Diamonds" {
//                    if player4DiamondCards.count > 0 {
//                        player4PlayingCard.append(getSmallerOrBiggerCards(player4DiamondCards, rankToCompare: biggestOfPlayingCards().rank, whichOne: "smaller"))
//                    }else{
//                        if haveBlackQueen(player4SpadeCards) {
//                            for card in player4SpadeCards {
//                                if card.rank > 12 {
//                                    player4PlayingCard.append(card)
//                                    break
//                                }
//                            }
//                        }else{
//                            if canPlayHearts {
//                                if player4HeartCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4HeartCards, whichOne: "biggest"))
//                                }else if player4SpadeCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4SpadeCards, whichOne: "biggest"))
//                                }else if player4ClubCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4ClubCards, whichOne: "biggest"))
//                                    
//                                }
//                            }else{
//                                if player4HeartCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4HeartCards, whichOne: "biggest"))
//                                    canPlayHearts = true
//                                }else if player4SpadeCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4SpadeCards, whichOne: "biggest"))
//                                }else if player4ClubCards.count > 0 {
//                                    player4PlayingCard.append(getSmallestOrBiggestCard(player4ClubCards, whichOne: "biggest"))
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            moveCard(node: player4PlayingCard[0], player: self.currentPlayer)
//            
//        }
//    }
//    
//    func dealCards() {
//        
//        for i in 0...suits.count - 1 {
//            for j in 2...14 {
//                let card: Card = Card(rank: j, suit: suits[i], faceUp: false)
//                deck.append(card)
//            }
//            
//        }
//        //for i in 0...deck.count - 1 {
//        //  println("\(deck[i].suit)_\(deck[i].rank)")
//        
//        var player: Int = 2
//        
//        let deal = SKAction.runBlock{ () -> Void in
//            
//            while self.deck.count > 0 { // if Deck count is 51
//                
//                let index: Int = Int(arc4random_uniform(UInt32(self.deck.count))) // a number between 0 and 51
//                
//                if player == 1 {
//                    
//                    self.MeCards.append(self.deck[index])
//                    let removedCard = self.deck.removeAtIndex(index)
//                    
//                    removedCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
//                    self.addChild(removedCard)
//                    removedCard.flip()
//                    
//                    let newX: CGFloat = (self.size.width - (self.cardOffset * 12 + removedCard.size.width))/2 + removedCard.size.width/2 + CGFloat(self.MeCards.count - 1) * self.cardOffset
//                    let newY: CGFloat = removedCard.size.height / 2 + self.sides //- 55
//                    self.MeCardPositions.append(CGPoint(x: newX, y: newY))
//                    
//                    let move = SKAction.moveTo(CGPointMake(newX, newY), duration: 1.0)
//                    removedCard.runAction(move)
//                    
//                    //                    self.dummyplayerCards.append(self.deck[index])
//                    //                    let removedCard = self.deck.removeAtIndex(index)
//                    //
//                    //                    removedCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
//                    //                    self.addChild(removedCard)
//                    //                    removedCard.flip()
//                    //
//                    //                    let newX: CGFloat = (self.size.width - (self.cardOffset * 12 + removedCard.size.width)) + removedCard.size.width + CGFloat(self.dummyplayerCards.count - 1) * self.cardOffset
//                    //                    let newY: CGFloat = removedCard.size.height / 2 + self.sides + 50
//                    //                    self.dummyCardPositions.append(CGPoint(x: newX, y: newY))
//                    //
//                    //                    let move = SKAction.moveTo(CGPointMake(newX, newY), duration: 1.0)
//                    //                    removedCard.runAction(move)
//                    
//                }else if player == 2 {
//                    
//                    self.player2Cards.append(self.deck[index])
//                    let removedCard = self.deck.removeAtIndex(index)
//                    
//                    removedCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
//                    self.addChild(removedCard)
//                    removedCard.flip()
//                    
//                    //let newX: CGFloat = (self.size.width - (self.cardOffset * 12 + removedCard.size.width))/2 + removedCard.size.width/2 + CGFloat(self.player2Cards.count - 1) * self.cardOffset
//                    //let newY: CGFloat = self.size.height - self.sides + 55 - removedCard.size.height / 2
//                    
//                    let newX: CGFloat = removedCard.size.width/2 + self.sides
//                    let cardsHeight = self.cardOffset * 12 + removedCard.size.height
//                    let bottomEdge = (self.size.height - cardsHeight) / 2
//                    let topEdge = self.size.height - bottomEdge
//                    let newY: CGFloat = topEdge - removedCard.size.width/2 - CGFloat(self.player2Cards.count - 1) * self.cardOffset
//                    self.player2CardPositions.append(CGPoint(x: newX, y: newY))
//                    
//                    let move = SKAction.moveTo(CGPointMake(newX, newY), duration: 1.0)
//                    removedCard.runAction(move)
//                    
//                }else if player == 3 {
//                    
//                    self.player3Cards.append(self.deck[index])
//                    let removedCard = self.deck.removeAtIndex(index)
//                    
//                    removedCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)) // this is where the cards are coming from (Dealer)
//                    self.addChild(removedCard)
//                    removedCard.flip()
//                    
//                    
//                    let newX: CGFloat = (self.size.width - (self.cardOffset * 12 + removedCard.size.width))/2 + removedCard.size.width/2 + CGFloat(self.player3Cards.count - 1) * self.cardOffset
//                    //let newY: CGFloat = self.size.height - self.sides - 40 - removedCard.size.height / 2
//                    let newY: CGFloat = self.size.height - self.sides - removedCard.size.height / 2
//                    self.player3CardPositions.append(CGPoint(x: newX, y: newY))
//                    
//                    let move = SKAction.moveTo(CGPointMake(newX, newY), duration: 1.0)
//                    removedCard.runAction(move)
//                    
//                }else if player == 4 {
//                    
//                    self.player4Cards.append(self.deck[index])
//                    let removedCard = self.deck.removeAtIndex(index)
//                    
//                    removedCard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
//                    self.addChild(removedCard)
//                    removedCard.flip()
//                    
//                    //let newX: CGFloat = (self.size.width - (self.cardOffset * 12 + removedCard.size.width))/2 + removedCard.size.width/2 + CGFloat(self.player4Cards.count - 1) * self.cardOffset
//                    //let newY: CGFloat = self.size.height - self.sides - 135 - removedCard.size.height / 2
//                    let newX: CGFloat = self.size.width - removedCard.size.width/2 - self.sides
//                    let cardsHeight = self.cardOffset * 12 + removedCard.size.height
//                    let bottomEdge = (self.size.height - cardsHeight) / 2
//                    let topEdge = self.size.height - bottomEdge
//                    let newY: CGFloat = topEdge - removedCard.size.width/2 - CGFloat(self.player4Cards.count - 1) * self.cardOffset
//                    self.player4CardPositions.append(CGPoint(x: newX, y: newY))
//                    
//                    let move = SKAction.moveTo(CGPointMake(newX, newY), duration: 1.0)
//                    removedCard.runAction(move)
//                    
//                    
//                }
//                player++
//                //println("\(player)")
//                if player == 5 {
//                    player = 1
//                }
//            }
//        }
//        
//        //self.runAction(deal)
//        
//        
//        let delay = SKAction.waitForDuration(2.0)
//        
//        let sort = SKAction.runBlock { () -> Void in
//            
//            self.MeCards = self.sortCards(self.MeCards)
//            self.player2Cards = self.sortCards(self.player2Cards)
//            self.player3Cards = self.sortCards(self.player3Cards)
//            self.player4Cards = self.sortCards(self.player4Cards)
//            //            self.player5Cards = self.sortCards(self.player5Cards)
//            //            self.player6Cards = self.sortCards(self.player6Cards)
//            //            self.player7Cards = self.sortCards(self.player7Cards)
//            //            self.player8Cards = self.sortCards(self.player8Cards)
//            //            self.player9Cards = self.sortCards(self.player9Cards)
//            //            self.dummyplayerCards = self.sortCards(self.dummyplayerCards)
//            
//            for i in 0...self.MeCards.count - 1 {
//                self.MeCards[i].zPosition = CGFloat(self.MeCards[i].rank) + self.cardType(self.MeCards[i].suit)
//                let move = SKAction.moveTo(self.MeCardPositions[i], duration: 1.0)
//                self.MeCards[i].runAction(move)
//            }
//            
//            //            for i in 0...self.dummyplayerCards.count - 1 {
//            //                self.dummyplayerCards[i].zPosition = CGFloat(self.dummyplayerCards[i].rank) + self.cardType(self.dummyplayerCards[i].suit)
//            //                let move = SKAction.moveTo(self.dummyCardPositions[i], duration: 1.0)
//            //                self.dummyplayerCards[i].runAction(move)
//            //            }
//            
//            for i in 0...self.player2Cards.count - 1 {
//                self.player2Cards[i].zPosition = CGFloat(self.player2Cards[i].rank) + self.cardType(self.player2Cards[i].suit)
//                let move = SKAction.moveTo(self.player2CardPositions[i], duration: 1.0)
//                self.player2Cards[i].runAction(move)
//            }
//            
//            for i in 0...self.player3Cards.count - 1 {
//                self.player3Cards[i].zPosition = CGFloat(self.player3Cards[i].rank) + self.cardType(self.player3Cards[i].suit)
//                let move = SKAction.moveTo(self.player3CardPositions[i], duration: 1.0)
//                self.player3Cards[i].runAction(move)
//            }
//            
//            for i in 0...self.player4Cards.count - 1 {
//                self.player4Cards[i].zPosition = CGFloat(self.player4Cards[i].rank) + self.cardType(self.player4Cards[i].suit)
//                let move = SKAction.moveTo(self.player4CardPositions[i], duration: 1.0)
//                self.player4Cards[i].runAction(move)
//            }
//            
//            
//        }
//        
//        let sequence = SKAction.sequence([deal, delay, sort, delay])
//        
//        self.runAction(sequence, completion: { () -> Void in
//            // let move = SKAction.moveTo(self.MePlayingPosition, duration: 1.0)
//            // self.MeCards[0].runAction(move)
//            self.gameInProgress = true
//            let turn: Int = Int(arc4random_uniform(4) + 1)
//            
//            self.currentPlayer = turn
//            self.flashCurrentPlayer(turn)
//            
//            if self.currentPlayer != 1 {
//                self.playcard(player: self.currentPlayer)
//            }
//            
//            
//            
//            
//        })
//    }
//    
//    func flashCurrentPlayer(player: Int) {
//        //        println("Player: \(player)'s turn")
//        
//        let fadeOut = SKAction.fadeAlphaTo(0, duration: 0.5)
//        let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 0.5)
//        let sequence = SKAction.sequence([fadeOut,fadeIn])
//        let repeatForEver = SKAction.repeatActionForever(sequence)
//        
//        if player == 1 {
//            
//            MeLabel.runAction(repeatForEver)
//            player2Label.removeAllActions()
//            player3Label.removeAllActions()
//            player4Label.removeAllActions()
//            //            player5Label.removeAllActions()
//            //            player6Label.removeAllActions()
//            //            player7Label.removeAllActions()
//            //            player8Label.removeAllActions()
//            //            player9Label.removeAllActions()
//            
//            let alpha = SKAction.fadeAlphaTo(1.0, duration: 1.0)
//            player2Label.runAction(alpha)
//            player3Label.runAction(alpha)
//            player4Label.runAction(alpha)
//            //            player5Label.runAction(alpha)
//            //            player6Label.runAction(alpha)
//            //            player7Label.runAction(alpha)
//            //            player8Label.runAction(alpha)
//            //            player9Label.runAction(alpha)
//            
//        }else if player == 2 {
//            player2Label.runAction(repeatForEver)
//            MeLabel.removeAllActions()
//            player3Label.removeAllActions()
//            player4Label.removeAllActions()
//            //            player5Label.removeAllActions()
//            //            player6Label.removeAllActions()
//            //            player7Label.removeAllActions()
//            //            player8Label.removeAllActions()
//            //            player9Label.removeAllActions()
//            
//            let alpha = SKAction.fadeAlphaTo(1.0, duration: 1.0)
//            MeLabel.runAction(alpha)
//            player3Label.runAction(alpha)
//            player4Label.runAction(alpha)
//            //            player5Label.runAction(alpha)
//            //            player6Label.runAction(alpha)
//            //            player7Label.runAction(alpha)
//            //            player8Label.runAction(alpha)
//            //            player9Label.runAction(alpha)
//            
//        }else if player == 3 {
//            
//            player3Label.runAction(repeatForEver)
//            MeLabel.removeAllActions()
//            player2Label.removeAllActions()
//            player4Label.removeAllActions()
//            //            player5Label.removeAllActions()
//            //            player6Label.removeAllActions()
//            //            player7Label.removeAllActions()
//            //            player8Label.removeAllActions()
//            //            player9Label.removeAllActions()
//            
//            let alpha = SKAction.fadeAlphaTo(1.0, duration: 1.0)
//            MeLabel.runAction(alpha)
//            player2Label.runAction(alpha)
//            player4Label.runAction(alpha)
//            //            player5Label.runAction(alpha)
//            //            player6Label.runAction(alpha)
//            //            player7Label.runAction(alpha)
//            //            player8Label.runAction(alpha)
//            //            player9Label.runAction(alpha)
//            
//        }else if player == 4 {
//            player4Label.runAction(repeatForEver)
//            MeLabel.removeAllActions()
//            player2Label.removeAllActions()
//            player3Label.removeAllActions()
//            //            player5Label.removeAllActions()
//            //            player6Label.removeAllActions()
//            //            player7Label.removeAllActions()
//            //            player8Label.removeAllActions()
//            //            player9Label.removeAllActions()
//            
//            let alpha = SKAction.fadeAlphaTo(1.0, duration: 1.0)
//            MeLabel.runAction(alpha)
//            player2Label.runAction(alpha)
//            player3Label.runAction(alpha)
//            //            player5Label.runAction(alpha)
//            //            player6Label.runAction(alpha)
//            //            player7Label.runAction(alpha)
//            //            player8Label.runAction(alpha)
//            //            player9Label.runAction(alpha)
//        }
//    }
//    
//    func moveCard(node node: Card, player: Int) {
//        
//        if player == 1 {
//            
//            let move = SKAction.moveTo(MePlayingPosition, duration: 0.5)
//            node.runAction(move, completion: { () -> Void in
//                
//                self.currentMoveCards.append(node)
//                self.MePlayingCard.append(node)
//                
//                for i in 0...self.MeCards.count - 1 {
//                    
//                    if node.rank == self.MeCards[i].rank && node.suit == self.MeCards[i].suit {
//                        self.MeCards.removeAtIndex(i)
//                        print("Player \(player)-\(node.rank)-\(node.suit)-\(self.currentMoveCards[0].suit)")
//                        break
//                    }
//                }
//                self.checkCurrentMove(self.currentPlayer)
//            })
//            
//        }else if player == 2 {
//            //node.flip()
//            let move = SKAction.moveTo(player2PlayingPosition, duration: 1.5)
//            node.runAction(move, completion: { () -> Void in
//                
//                self.currentMoveCards.append(node)
//                // self.player2PlayingCard.append(node)
//                
//                for i in 0...self.player2Cards.count - 1 {
//                    
//                    if node.rank == self.player2Cards[i].rank && node.suit == self.player2Cards[i].suit {
//                        self.player2Cards.removeAtIndex(i)
//                        print("Player \(player)-\(node.rank)-\(node.suit)-\(self.currentMoveCards[0].suit)")
//                        break
//                    }
//                }
//                self.checkCurrentMove(self.currentPlayer)
//            })
//            
//        }else if player == 3 {
//            //node.flip()
//            let move = SKAction.moveTo(player3PlayingPosition, duration: 1.5)
//            node.runAction(move, completion: { () -> Void in
//                
//                self.currentMoveCards.append(node)
//                // self.player3PlayingCard.append(node)
//                
//                for i in 0...self.player3Cards.count - 1 {
//                    
//                    if node.rank == self.player3Cards[i].rank && node.suit == self.player3Cards[i].suit {
//                        self.player3Cards.removeAtIndex(i)
//                        print("Player \(player)-\(node.rank)-\(node.suit)-\(self.currentMoveCards[0].suit)")
//                        break
//                    }
//                }
//                self.checkCurrentMove(self.currentPlayer)
//            })
//            
//        }else if player == 4 {
//            //node.flip()
//            let move = SKAction.moveTo(player4PlayingPosition, duration: 1.5)
//            node.runAction(move, completion: { () -> Void in
//                
//                self.currentMoveCards.append(node)
//                // self.player4PlayingCard.append(node)
//                
//                for i in 0...self.player4Cards.count - 1 {
//                    
//                    if node.rank == self.player4Cards[i].rank && node.suit == self.player4Cards[i].suit {
//                        self.player4Cards.removeAtIndex(i)
//                        print("Player \(player)-\(node.rank)-\(node.suit)-\(self.currentMoveCards[0].suit)")
//                        break
//                    }
//                }
//                self.checkCurrentMove(self.currentPlayer)
//            })
//            
//            
//        }
//        
//    }
//    
//    func displayMessage(msg msg: String) {
//        
//        var message = SKLabelNode(fontNamed: "Arial")
//        message.fontSize = 40
//        message.fontColor = SKColor.blackColor()
//        message.text = msg
//        message.position = CGPointMake(CGRectGetMidX(self.frame), 200)
//        message.zPosition = 100
//        self.addChild(message)
//        
//        let fadeOut = SKAction.fadeAlphaTo(0, duration: 2.0)
//        let remove = SKAction.removeFromParent()
//        let fadeSequence = SKAction.sequence([fadeOut, remove])
//        
//        let scale = SKAction.scaleTo(1.5, duration: 1.8)
//        
//        let messageAnnimation = SKAction.group([fadeSequence, scale])
//        message.runAction(messageAnnimation)
//        
//    }
//    
//    func checkCurrentMove(player: Int) {
//        
//        if currentMoveCards.count == 4 {
//            
//            print("Cards Played")
//            var validCards: [Int] = [0,0,0,0]
//            
//            if MePlayingCard[0].suit == currentMoveCards[0].suit {
//                validCards[0] = MePlayingCard[0].rank
//            }
//            if player2PlayingCard[0].suit == currentMoveCards[0].suit {
//                validCards[1] = player2PlayingCard[0].rank
//            }
//            if player3PlayingCard[0].suit == currentMoveCards[0].suit {
//                validCards[2] = player3PlayingCard[0].rank
//            }
//            if player4PlayingCard[0].suit == currentMoveCards[0].suit {
//                validCards[3] = player4PlayingCard[0].rank
//            }
//            //            if player5PlayingCard[0].suit == currentMoveCards[0].suit {
//            //                validCards[5] = player5PlayingCard[0].rank
//            //            }
//            //            if player6PlayingCard[0].suit == currentMoveCards[0].suit {
//            //                validCards[6] = player6PlayingCard[0].rank
//            //            }
//            //            if player7PlayingCard[0].suit == currentMoveCards[0].suit {
//            //                validCards[7] = player7PlayingCard[0].rank
//            //            }
//            //            if player8PlayingCard[0].suit == currentMoveCards[0].suit {
//            //                validCards[8] = player8PlayingCard[0].rank
//            //            }
//            //            if player9PlayingCard[0].suit == currentMoveCards[0].suit {
//            //                validCards[9] = player9PlayingCard[0].rank
//            //            }
//            //            if dummyPlayingCard[0].suit == currentMoveCards[0].suit {
//            //                validCards[1] = dummyPlayingCard[0].rank
//            //            }
//            
//            var maxPlayer: Int = 0
//            var maxRank: Int = 0
//            
//            if validCards[0] > validCards[1] {
//                maxPlayer = 1
//                maxRank = validCards[0]
//            }else {
//                maxPlayer = 2
//                maxRank = validCards[1]
//            }
//            if validCards[2] > maxRank {
//                maxPlayer = 3
//                maxRank = validCards[2]
//            }
//            if validCards[3] > maxRank {
//                maxPlayer = 4
//                maxRank = validCards[3]
//            }
//            
//            switch maxPlayer {
//                
//            case 1:
//                
//                for card in currentMoveCards {
//                    if card.suit == "Hearts" {
//                        self.MeScore += 1
//                    }else if card.suit == "Spades" && card.rank == 12 {
//                        self.MeScore += 12
//                    }
//                    
//                }
//                
//                let endingX = self.size.width/2
//                let endingY = -MePlayingCard[0].size.height/2
//                
//                let move = SKAction.moveTo(CGPoint(x: endingX, y: endingY), duration: 0.5)
//                let remove = SKAction.removeFromParent()
//                let sequence = SKAction.sequence([move, remove])
//                
//                let blockAction = SKAction.runBlock( { () -> Void in
//                    
//                    self.MePlayingCard[0].runAction(sequence)
//                    self.player2PlayingCard[0].runAction(sequence)
//                    self.player3PlayingCard[0].runAction(sequence)
//                    self.player4PlayingCard[0].runAction(sequence)
//                    //                    self.player5PlayingCard[0].runAction(sequence)
//                    //                    self.player6PlayingCard[0].runAction(sequence)
//                    //                    self.player7PlayingCard[0].runAction(sequence)
//                    //                    self.player8PlayingCard[0].runAction(sequence)
//                    //                    self.player9PlayingCard[0].runAction(sequence)
//                    
//                })
//                
//                self.runAction(blockAction, completion: { () -> Void in
//                    
//                    self.MeScoreLabel.text = "Score:\(self.MeScore)"
//                    
//                    self.MePlayingCard = [Card]()
//                    self.player2PlayingCard = [Card]()
//                    self.player3PlayingCard = [Card]()
//                    self.player4PlayingCard = [Card]()
//                    //                    self.player5PlayingCard = [Card]()
//                    //                    self.player6PlayingCard = [Card]()
//                    //                    self.player7PlayingCard = [Card]()
//                    //                    self.player8PlayingCard = [Card]()
//                    //                    self.player9PlayingCard = [Card]()
//                    self.currentMoveCards = [Card]()
//                    
//                    print("You")
//                    self.currentPlayer = 1
//                    self.flashCurrentPlayer(self.currentPlayer)
//                    
//                    self.checkWin()
//                    
//                })
//                
//            case 2:
//                
//                for card in currentMoveCards {
//                    if card.suit == "Hearts" {
//                        self.player2Score += 1
//                    }else if card.suit == "Spades" && card.rank == 12 {
//                        self.player2Score += 12
//                    }
//                    
//                }
//                
//                let endingX = -player2PlayingCard[0].size.height/2
//                let endingY = self.size.width/2
//                
//                let move = SKAction.moveTo(CGPoint(x: endingX, y: endingY), duration: 0.5)
//                let remove = SKAction.removeFromParent()
//                let sequence = SKAction.sequence([move, remove])
//                
//                let blockAction = SKAction.runBlock( { () -> Void in
//                    
//                    self.MePlayingCard[0].runAction(sequence)
//                    self.player2PlayingCard[0].runAction(sequence)
//                    self.player3PlayingCard[0].runAction(sequence)
//                    self.player4PlayingCard[0].runAction(sequence)
//                    //                    self.player5PlayingCard[0].runAction(sequence)
//                    //                    self.player6PlayingCard[0].runAction(sequence)
//                    //                    self.player7PlayingCard[0].runAction(sequence)
//                    //                    self.player8PlayingCard[0].runAction(sequence)
//                    //                    self.player9PlayingCard[0].runAction(sequence)
//                    
//                })
//                
//                self.runAction(blockAction, completion: { () -> Void in
//                    
//                    self.player2ScoreLabel.text = "Score:\(self.player2Score)"
//                    
//                    self.MePlayingCard = [Card]()
//                    self.player2PlayingCard = [Card]()
//                    self.player3PlayingCard = [Card]()
//                    self.player4PlayingCard = [Card]()
//                    //                    self.player5PlayingCard = [Card]()
//                    //                    self.player6PlayingCard = [Card]()
//                    //                    self.player7PlayingCard = [Card]()
//                    //                    self.player8PlayingCard = [Card]()
//                    //                    self.player9PlayingCard = [Card]()
//                    self.currentMoveCards = [Card]()
//                    
//                    print("Player 2")
//                    self.currentPlayer = 2
//                    self.flashCurrentPlayer(self.currentPlayer)
//                    
//                    self.checkWin()
//                    
//                })
//                
//            case 3:
//                
//                for card in currentMoveCards {
//                    if card.suit == "Hearts" {
//                        self.player3Score += 1
//                    }else if card.suit == "Spades" && card.rank == 12 {
//                        self.player3Score += 12
//                    }
//                    
//                }
//                
//                let endingX = self.size.width/2
//                let endingY = self.size.height/2 + player3PlayingCard[0].size.height/2
//                
//                let move = SKAction.moveTo(CGPoint(x: endingX, y: endingY), duration: 0.5)
//                let remove = SKAction.removeFromParent()
//                let sequence = SKAction.sequence([move, remove])
//                
//                let blockAction = SKAction.runBlock( { () -> Void in
//                    
//                    self.MePlayingCard[0].runAction(sequence)
//                    self.player2PlayingCard[0].runAction(sequence)
//                    self.player3PlayingCard[0].runAction(sequence)
//                    self.player4PlayingCard[0].runAction(sequence)
//                    //                    self.player5PlayingCard[0].runAction(sequence)
//                    //                    self.player6PlayingCard[0].runAction(sequence)
//                    //                    self.player7PlayingCard[0].runAction(sequence)
//                    //                    self.player8PlayingCard[0].runAction(sequence)
//                    //                    self.player9PlayingCard[0].runAction(sequence)
//                    
//                })
//                
//                self.runAction(blockAction, completion: { () -> Void in
//                    
//                    self.player3ScoreLabel.text = "Score:\(self.player3Score)"
//                    
//                    self.MePlayingCard = [Card]()
//                    self.player2PlayingCard = [Card]()
//                    self.player3PlayingCard = [Card]()
//                    self.player4PlayingCard = [Card]()
//                    //                    self.player5PlayingCard = [Card]()
//                    //                    self.player6PlayingCard = [Card]()
//                    //                    self.player7PlayingCard = [Card]()
//                    //                    self.player8PlayingCard = [Card]()
//                    //                    self.player9PlayingCard = [Card]()
//                    self.currentMoveCards = [Card]()
//                    
//                    print("Player 3")
//                    self.currentPlayer = 3
//                    self.flashCurrentPlayer(self.currentPlayer)
//                    
//                    self.checkWin()
//                    
//                })
//                
//            case 4:
//                
//                for card in currentMoveCards {
//                    if card.suit == "Hearts" {
//                        self.player4Score += 1
//                    }else if card.suit == "Spades" && card.rank == 12 {
//                        self.player4Score += 12
//                    }
//                    
//                }
//                
//                let endingX = self.size.width + player4PlayingCard[0].size.height/2
//                let endingY = self.size.height/2
//                
//                let move = SKAction.moveTo(CGPoint(x: endingX, y: endingY), duration: 0.5)
//                let remove = SKAction.removeFromParent()
//                let sequence = SKAction.sequence([move, remove])
//                
//                let blockAction = SKAction.runBlock( { () -> Void in
//                    
//                    self.MePlayingCard[0].runAction(sequence)
//                    self.player2PlayingCard[0].runAction(sequence)
//                    self.player3PlayingCard[0].runAction(sequence)
//                    self.player4PlayingCard[0].runAction(sequence)
//                    //                    self.player5PlayingCard[0].runAction(sequence)
//                    //                    self.player6PlayingCard[0].runAction(sequence)
//                    //                    self.player7PlayingCard[0].runAction(sequence)
//                    //                    self.player8PlayingCard[0].runAction(sequence)
//                    //                    self.player9PlayingCard[0].runAction(sequence)
//                    
//                })
//                
//                self.runAction(blockAction, completion: { () -> Void in
//                    
//                    self.player4ScoreLabel.text = "Score:\(self.player4Score)"
//                    
//                    self.MePlayingCard = [Card]()
//                    self.player2PlayingCard = [Card]()
//                    self.player3PlayingCard = [Card]()
//                    self.player4PlayingCard = [Card]()
//                    //                    self.player5PlayingCard = [Card]()
//                    //                    self.player6PlayingCard = [Card]()
//                    //                    self.player7PlayingCard = [Card]()
//                    //                    self.player8PlayingCard = [Card]()
//                    //                    self.player9PlayingCard = [Card]()
//                    self.currentMoveCards = [Card]()
//                    
//                    print("Player 4")
//                    self.currentPlayer = 4
//                    self.flashCurrentPlayer(self.currentPlayer)
//                    
//                    self.checkWin()
//                    
//                })
//                
//            default:
//                
//                print("Some Error Occured")
//            }
//            
//        }else{
//            if player == 1 {
//                currentPlayer = 2
//                flashCurrentPlayer(currentPlayer)
//                playcard(player: currentPlayer)
//            }else if player == 2 {
//                currentPlayer = 3
//                flashCurrentPlayer(currentPlayer)
//                playcard(player: currentPlayer)
//            }else if player == 3 {
//                currentPlayer = 4
//                flashCurrentPlayer(currentPlayer)
//                playcard(player: currentPlayer)
//            }else if player == 4 {
//                currentPlayer = 1
//                flashCurrentPlayer(currentPlayer)
//                //playcard(player: currentPlayer)
//                //            }else if player == 5 {
//                //                currentPlayer = 6
//                //                flashCurrentPlayer(currentPlayer)
//                //                playcard(player: currentPlayer)
//                //            }else if player == 6 {
//                //                currentPlayer = 7
//                //                flashCurrentPlayer(currentPlayer)
//                //                playcard(player: currentPlayer)
//                //            }else if player == 7 {
//                //                currentPlayer = 8
//                //                flashCurrentPlayer(currentPlayer)
//                //                playcard(player: currentPlayer)
//                //            }else if player == 8 {
//                //                currentPlayer = 9
//                //                flashCurrentPlayer(currentPlayer)
//                //                playcard(player: currentPlayer)
//                //            }else if player == 9 {
//                //                currentPlayer = 10
//                //                flashCurrentPlayer(currentPlayer)
//                //                playcard(player: currentPlayer)
//                //            }else if player == 10 {
//                //                currentPlayer = 1
//                //                flashCurrentPlayer(currentPlayer)
//                //                //playcard(player: currentPlayer)
//            }
//            
//        }
//    }
//    
//    func checkWin() {
//        
//        if MeCards.count == 0 {
//            
//            if MeScore >= 30 || player2Score >= 30 || player3Score >= 30 || player4Score >= 30 {
//                // Somebody Won the Game
//                
//                gameInProgress = false
//                
//                var winner: String = ""
//                var score: Int = 0
//                
//                if MeScore > player2Score {
//                    winner = "YOU"
//                    score = MeScore
//                }else{
//                    winner = "Player 2"
//                    score = player2Score
//                }
//                if player3Score > score {
//                    winner = "Player 3"
//                    score = player3Score
//                }
//                if player4Score > score {
//                    winner = "Player 4"
//                    score = player4Score
//                }
//                
//                let winningLabel = SKLabelNode(fontNamed: "Copperplate-Bold")
//                winningLabel.fontSize = 50
//                winningLabel.fontColor = SKColor.blackColor()
//                winningLabel.text = "\(winner) WON"
//                
//                winningLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 150)
//                self.addChild(winningLabel)
//                
//                let scaleDown = SKAction.scaleTo(0.1, duration: 0.1)
//                let scaleUp = SKAction.scaleTo(1.5, duration: 3.0)
//                let scale = SKAction.scaleTo(1, duration: 0.25)
//                let sequence = SKAction.sequence([scaleDown, scaleUp, scale])
//                
//                winningLabel.runAction(sequence, completion: { () -> Void in
//                    
//                    let restartLabel = SKLabelNode(fontNamed: "Copperplate-Bold")
//                    restartLabel.fontSize = 30
//                    restartLabel.fontColor = SKColor.blackColor()
//                    restartLabel.text = "Touch to Restart"
//                    
//                    restartLabel.position = CGPointMake(CGRectGetMidX(self.frame), winningLabel.position.y - 30)
//                    self.addChild(restartLabel)
//                    
//                    let fadeOut = SKAction.fadeAlphaTo(0, duration: 0.25)
//                    let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 0.25)
//                    let sequence = SKAction.sequence([fadeOut, fadeIn])
//                    let `repeat` = SKAction.repeatActionForever(sequence)
//                    restartLabel.runAction(`repeat`)
//                    
//                })
//                
//            }else {
//                //Re-Deal the Cards
//                
//                print("New Hand")
//                dealCards()
//                //                canPlaySpades = true
//                //                canPlayDiamonds = false
//                //                canPlayClubs = true
//                canPlayHearts = false
//            }
//            
//        }else {
//            // Next Turn
//            
//            if self.currentPlayer != 1 {
//                playcard(player: currentPlayer)
//            }
//            
//        }
//        
//    }
//    
//    func cardType(suit: String) -> CGFloat {
//        
//        var type: CGFloat = 0
//        if suit == "Spades" {
//            type = 0
//        }else if suit == "Hearts" {
//            type = 13
//        }else if suit == "Clubs" {
//            type = 26
//        }else if suit == "Diamonds" {
//            type = 39
//        }
//        return type
//    }
//    
//    func sortCards(playerCards: [Card]) -> [Card] {
//        
//        var spadeCards = [Card]()
//        var heartCards = [Card]()
//        var clubCards = [Card]()
//        var diamondCards = [Card]()
//        
//        for i in 0...playerCards.count - 1 {
//            
//            if playerCards[i].suit == "Spades" {
//                spadeCards.append(playerCards[i])
//            }else if playerCards[i].suit == "Hearts" {
//                heartCards.append(playerCards[i])
//            }else if playerCards[i].suit == "Clubs" {
//                clubCards.append(playerCards[i])
//            }else if playerCards[i].suit == "Diamonds" {
//                diamondCards.append(playerCards[i])
//            }
//        }
//        
//        if spadeCards.count > 1 {
//            
//            for i in 1...spadeCards.count {
//                for j in 0...spadeCards.count - 2 {
//                    
//                    if spadeCards[j+1].rank < spadeCards[j].rank {
//                        
//                        let temp = spadeCards[j]
//                        spadeCards[j] = spadeCards[j+1]
//                        spadeCards[j+1] = temp
//                    }
//                }
//            }
//        }
//        
//        if heartCards.count > 1 {
//            
//            for i in 1...heartCards.count {
//                for j in 0...heartCards.count - 2 {
//                    
//                    if heartCards[j+1].rank < heartCards[j].rank {
//                        
//                        let temp = heartCards[j]
//                        heartCards[j] = heartCards[j+1]
//                        heartCards[j+1] = temp
//                    }
//                }
//            }
//        }
//        
//        if clubCards.count > 1 {
//            
//            for i in 1...clubCards.count {
//                for j in 0...clubCards.count - 2 {
//                    
//                    if clubCards[j+1].rank < clubCards[j].rank {
//                        
//                        let temp = clubCards[j]
//                        clubCards[j] = clubCards[j+1]
//                        clubCards[j+1] = temp
//                    }
//                }
//            }
//        }
//        
//        if diamondCards.count > 1 {
//            
//            for i in 1...diamondCards.count {
//                for j in 0...diamondCards.count - 2 {
//                    
//                    if diamondCards[j+1].rank < diamondCards[j].rank {
//                        
//                        let temp = diamondCards[j]
//                        diamondCards[j] = diamondCards[j+1]
//                        diamondCards[j+1] = temp
//                    }
//                }
//            }
//        }
//        
//        var shuffledPlayedCards = [Card]()
//        
//        if spadeCards.count > 0 {
//            for i in 0...spadeCards.count - 1 {
//                shuffledPlayedCards.append(spadeCards[i])
//            }
//        }
//        if heartCards.count > 0 {
//            for i in 0...heartCards.count - 1 {
//                shuffledPlayedCards.append(heartCards[i])
//            }
//        }
//        if clubCards.count > 0 {
//            for i in 0...clubCards.count - 1 {
//                shuffledPlayedCards.append(clubCards[i])
//            }
//        }
//        if diamondCards.count > 0 {
//            for i in 0...diamondCards.count - 1 {
//                shuffledPlayedCards.append(diamondCards[i])
//            }
//        }
//        
//        return shuffledPlayedCards
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//        
//    }
//    
//    override func didMoveToView(view: SKView) {
//        /* Setup your scene here */
//        
//    }
//    
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        
//        for touch: AnyObject in touches {
//            
//            let location = touch.locationInNode(self)
//            
//            if gameInProgress {
//                // Human Player's Move
//                
//                if let node = nodeAtPoint(location) as? Card {
//                    
//                    if MeCards.contains(node) && currentPlayer == 1 {
//                        
//                        if currentMoveCards.count == 0 {
//                            
//                            if node.suit != "Hearts" {
//                                moveCard(node: node, player: self.currentPlayer)
//                            }else {
//                                if canPlayHearts {
//                                    moveCard(node: node, player: self.currentPlayer)
//                                }else {
//                                    var hasOtherCards: Bool = false
//                                    for i in 0...self.MeCards.count - 1 {
//                                        if MeCards[i].suit != "Hearts" {
//                                            hasOtherCards = true
//                                            break
//                                        }
//                                    }
//                                    if hasOtherCards {
//                                        displayMessage(msg: "You Cannot Play Hearts Yet")
//                                    }else {
//                                        moveCard(node: node, player: self.currentPlayer)
//                                        canPlayHearts = true
//                                    }
//                                    
//                                }
//                            }
//                            
//                        }else {
//                            
//                            var hasPlayingSuit: Bool = false
//                            var hasPlayingRank: Bool = false
//                            for card in MeCards {
//                                if card.suit == currentMoveCards[0].suit {
//                                    hasPlayingSuit = true
//                                    if card.rank == currentMoveCards[0].rank + 1 {
//                                        hasPlayingRank = true
//                                        break
//                                    }
//                                }
//                            }
//                            if hasPlayingSuit {
//                                if node.suit == currentMoveCards[0].suit {
//                                    moveCard(node: node, player: self.currentPlayer)
//                                }else {
//                                    displayMessage(msg: "You Can't Play This Card")
//                                }
//                            }else {
//                                moveCard(node: node, player: self.currentPlayer)
//                            }
//                        }
//                    }
//                }
//                
//            }else {
//                // Restart Player's Move
//                let scene = GameScene(size: self.frame.size)
//                self.view?.presentScene(scene)
//            }
//        }
//    }
//    
//    // Helper Methods for Artificial Intelligence
//    
//    func getSmallestOrBiggestCard(cards: [Card], whichOne: String) -> Card {
//        
//        var returnCard: Card = cards[0]
//        if cards.count > 1 {
//            
//            for i in 1...cards.count - 1 {
//                if whichOne == "smallest" {
//                    if cards[i].rank < returnCard.rank {
//                        returnCard = cards[i]
//                        
//                    }
//                }else {
//                    if cards[i].rank > returnCard.rank {
//                        returnCard = cards[i]
//                    }
//                }
//            }
//        }
//        return returnCard
//        
//    }
//
//    func biggestOfPlayingCards() -> Card {
//        
//        var playingSuitCards = [Card]()
//        if currentMoveCards.count > 1 {
//            playingSuitCards.append(currentMoveCards[0])
//            for i in 1...currentMoveCards.count - 1 {
//                if currentMoveCards[i].suit == currentMoveCards[0].suit {
//                    playingSuitCards.append(currentMoveCards[i])
//                }
//            }
//            
//            var biggest = getSmallestOrBiggestCard(playingSuitCards, whichOne: "biggest")
//            return biggest
//            
//        }else {
//            playingSuitCards.append(currentMoveCards[0])
//            return playingSuitCards[0]
//        }
//        
//    }
//
//    func haveSmallerOrBiggerCard(cards: [Card], rankToCompare : Int, whichOne: String) -> Bool {
//        
//        if whichOne == "smaller" {
//            for card in cards {
//                if card.rank < rankToCompare {
//                    return true
//                    
//                }
//            }
//        }else {
//            for card in cards {
//                if card.rank > rankToCompare {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//
//    func getSmallerOrBiggerCards(cards: [Card], rankToCompare: Int, whichOne: String) -> Card {
//        
//        var smallerOrBiggerCards = [Card]()
//        
//        if haveSmallerOrBiggerCard(cards, rankToCompare: rankToCompare, whichOne: whichOne) {
//            for card in cards {
//                if whichOne == "smaller" {
//                    if card.rank < rankToCompare {
//                        smallerOrBiggerCards.append(card)
//                        
//                    }
//                }else {
//                    if card.rank > rankToCompare {
//                        smallerOrBiggerCards.append(card)
//                    }
//                }
//            }
//            
//            var returnCard: Card
//            if whichOne == "smaller" {
//                returnCard = getSmallestOrBiggestCard(smallerOrBiggerCards, whichOne: "biggest")
//            }else {
//                returnCard = getSmallestOrBiggestCard(smallerOrBiggerCards, whichOne: "smallest")
//            }
//            return returnCard
//        }else {
//            for card in cards {
//                if whichOne == "smaller" {
//                    if card.rank > rankToCompare {
//                        smallerOrBiggerCards.append(card)
//                    }
//                }else {
//                    if card.rank < rankToCompare {
//                        smallerOrBiggerCards.append(card)
//                    }
//                }
//            }
//            var returnCard: Card
//            if whichOne == "smaller" {
//                returnCard = getSmallestOrBiggestCard(smallerOrBiggerCards, whichOne: "smallest")
//            }else {
//                returnCard = getSmallestOrBiggestCard(smallerOrBiggerCards, whichOne: "biggest")
//            }
//            return returnCard
//        }
//        
//        
//    }
//    func haveBlackQueen(cards: [Card]) -> Bool {
//        
//        for card in cards {
//            if card.rank == 12 && card.suit == "Spades" {
//                return true
//            }
//        }
//        return false
//    }
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
//
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        /* Called when a touch begins */
//        
//        //displayMessage(msg: "You Touched the Screen")
//        
//        for touch: AnyObject in touches {
//            
//            let location = touch.locationInNode(self)
//            if let node = nodeAtPoint(location) as? Card {
//                node.flip()
//            }
//        }
//    }
//    
//    override func update(currentTime: CFTimeInterval) {
//        /* Called before each frame is rendered */
//    }
//}
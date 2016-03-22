//
//  GameModel.h
//  PlayerMath
//
//  Created by Scott Mayhew on 2016-03-14.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface GameModel : NSObject

@property (nonatomic) int number1;
@property (nonatomic) int number2;
@property (nonatomic) int answer;

@property (nonatomic) Player *player1;
@property (nonatomic) Player *player2;
@property (nonatomic) Player *currentPlayer;

-(NSString *)generateQuestion;
-(void)checkAnswer:(int)inputAnswer;

@end

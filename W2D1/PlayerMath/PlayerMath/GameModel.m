//
//  GameModel.m
//  PlayerMath
//
//  Created by Scott Mayhew on 2016-03-14.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.player1 = [[Player alloc] initWithName:@"Player1" andScore:3];
        self.player2 = [[Player alloc] initWithName:@"Player2" andScore:3];
        self.currentPlayer = self.player1;
    }
    return self;
}

//-(int)randomNumGenerator {
//    int number = arc4random_uniform(20) + 1;
//    return number;
//}

-(NSString *)generateQuestion {
    self.number1 = arc4random_uniform(20)+1;
    self.number2 = arc4random_uniform(20)+1;
    self.answer = self.number1 + self.number2;
    
    NSString * answerString = [NSString stringWithFormat:@"%@: %d + %d", self.currentPlayer.name, self.number1, self.number2];
    NSLog(@"%@", answerString);
    return answerString;
}

-(void)checkAnswer:(int)inputAnswer {
    
    //1. check if answer is wrong, if its wrong decrease score on current player
    //2. change current player
    NSLog(@"correct answer %d your answer %d", inputAnswer, self.answer);
    if (inputAnswer != self.answer) {
        self.currentPlayer.score -= 1;
    }
    
    if (self.currentPlayer == self.player1) {
        self.currentPlayer = self.player2;
        
    } else {
        self.currentPlayer = self.player1;
    }
}


@end

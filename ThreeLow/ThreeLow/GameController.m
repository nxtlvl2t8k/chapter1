//
//  GameController.m
//  ThreeLow
//
//  Created by Scott Mayhew on 2016-03-09.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "GameController.h"
#import "dice.h"

@interface GameController()

@property (nonatomic) Dice *dice1;
@property (nonatomic) Dice *dice2;
@property (nonatomic) Dice *dice3;
@property (nonatomic) Dice *dice4;
@property (nonatomic) Dice *dice5;

@end

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dice1 = [[Dice alloc] init];
        _dice2 = [[Dice alloc] init];
        _dice3 = [[Dice alloc] init];
        _dice4 = [[Dice alloc] init];
        _dice5 = [[Dice alloc] init];
        
        self.rolledDice = [NSMutableArray array];
        self.held = [[NSMutableSet alloc] init];

        //adds in dice array
        [self.rolledDice addObject:self.dice1];
        [self.rolledDice addObject:self.dice2];
        [self.rolledDice addObject:self.dice3];
        [self.rolledDice addObject:self.dice4];
        [self.rolledDice addObject:self.dice5];
    }
    return self;
}

-(void)roll {
    for (Dice * aDice in self.rolledDice) {
        if (![self.held containsObject:aDice]) {
            [aDice roll];
            NSLog(@"%@", aDice);
        }

    }
    NSLog(@"\n\n Dice1 Dice2 Dice2 Dice2 Dice2\n   %d --- %d --- %d --- %d --- %d\n", self.dice1.currentValue, self.dice2.currentValue, self.dice3.currentValue, self.dice4.currentValue, self.dice5.currentValue);

}

-(void)holdDie {
    
}


-(void)controller {

}

-(void)dataModel {

}


@end

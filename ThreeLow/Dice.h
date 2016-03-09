//
//  Dice.h
//  ThreeLow
//
//  Created by Scott Mayhew on 2016-03-09.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property (nonatomic) float Dice1;
@property (nonatomic) float Dice2;
@property (nonatomic) float Dice3;
@property (nonatomic) float Dice4;
@property (nonatomic) float Dice5;

-(int)randomValue;

@end

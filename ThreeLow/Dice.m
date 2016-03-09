//
//  Dice.m
//  ThreeLow
//
//  Created by Scott Mayhew on 2016-03-09.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)initEndValue:(float)endValue
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(int)randomValue {
    return arc4random_uniform(6) + 1;
    
}



@end

//
//  Dice.m
//  ThreeLow
//
//  Created by Scott Mayhew on 2016-03-09.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self randomValue];
    }
    return self;
}

-(int)roll {
    [self randomValue];
    return self.currentValue;
}

-(void)randomValue {
    self.currentValue = arc4random_uniform(6) + 1;
}

//-(int)currentValue {
//    self.currentDie = [self randomValue] ;
//    
//    return self.currentDie;
//}

- (NSString *)description {
    NSString * description = ({
        description = [super description];
        description = [description stringByAppendingFormat:@" - value %@", @(self.currentValue)];
        description;
    });
    return description;
}

@end

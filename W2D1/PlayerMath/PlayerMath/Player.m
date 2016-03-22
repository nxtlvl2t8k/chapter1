//
//  Player.m
//  PlayerMath
//
//  Created by Scott Mayhew on 2016-03-14.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString *)name andScore:(int)score
{
    self = [super init];
    if (self) {
        self.name = name;
        self.score = score;
    }
    return self;
}

@end

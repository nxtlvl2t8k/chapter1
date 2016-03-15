//
//  GameModel.m
//  PlayerMath
//
//  Created by Scott Mayhew on 2016-03-14.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "GameModel.h"


@implementation GameModel


- (instancetype)initWithPlayer:(NSNumber *) player
{
    self = [super init];
    if (self) {
        self.player1 = [[Player alloc] init];
        self.player2 = [[Player alloc] init];

    }
    return self;
}


-(void)updateEverything{
   //Update labels
    
    //Update score
    
    //Update results
    
    //Clear Data
    
}

-(void)incrementValue{
    
}

-(void)decrementValue{
    
}

@end

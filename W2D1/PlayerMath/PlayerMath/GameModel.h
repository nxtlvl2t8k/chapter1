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

@property (strong, nonatomic) Player *player1;
@property (strong, nonatomic) Player *player2;
@property (strong, nonatomic) NSNumber* number;
@property (strong, nonatomic) NSNumber* score;

- (instancetype)initWithPlayer:(NSNumber *) player;

-(void)updateEverything;

@end

//
//  Player.h
//  PlayerMath
//
//  Created by Scott Mayhew on 2016-03-14.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) int score;

- (instancetype)initWithName:(NSString *)name andScore:(int)score;

@end

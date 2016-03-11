//
//  GameController.h
//  ThreeLow
//
//  Created by Scott Mayhew on 2016-03-09.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GameController : NSObject

@property (nonatomic) NSMutableArray *rolledDice;
@property (nonatomic) NSMutableSet *held;

-(void)roll;
-(void)dataModel;
-(void)controller;
-(void)holdDie;


@end

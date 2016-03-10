//
//  main.m
//  ThreeLow
//
//  Created by Scott Mayhew on 2016-03-09.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "inputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSMutableArray *dice = [NSMutableArray array];
        NSMutableSet *held = [[NSMutableSet alloc] init];
        Dice *dice1 = [[Dice alloc] init];
        Dice *dice2 = [[Dice alloc] init];
        Dice *dice3 = [[Dice alloc] init];
        Dice *dice4 = [[Dice alloc] init];
        Dice *dice5 = [[Dice alloc] init];
        
        //adds in dice array
        [dice addObject:dice1];
        [dice addObject:dice2];
        [dice addObject:dice3];
        [dice addObject:dice4];
        [dice addObject:dice5];
        
        while (true) {
            
            
            inputCollector *rollPressed = [[inputCollector alloc] init];
            
            NSString *startGame = @"\nType 'roll' to play Threelow and 'quit' to exit%@";
            NSString *input = [rollPressed inputPrompt:startGame];
            
            if ([input isEqualToString:@"roll"]) {
                
                
                NSLog(@"%@", dice);
                NSLog(@"\n\n Dice1 Dice2 Dice2 Dice2 Dice2\n   %d --- %d --- %d --- %d --- %d\n", dice1.currentValue, dice2.currentValue, dice3.currentValue, dice4.currentValue, dice5.currentValue);
                
            }else if ([input isEqualToString:@"quit"]) {
                return 0;
            }
        }
    }
    return 0;
}

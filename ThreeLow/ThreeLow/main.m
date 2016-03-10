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
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        GameController *game = [[GameController alloc] init];
        
        while (true) {
            
            
            inputCollector *rollPressed = [[inputCollector alloc] init];
            
            NSString *startGame = @"\nType 'roll' to play Threelow and 'quit' to exit%@";
            NSString *input = [rollPressed inputPrompt:startGame];
            
            if ([input isEqualToString:@"roll"]) {
    
                [game roll];
                
                
            }else if ([input isEqualToString:@"quit"]) {
                return 0;
            }
        }
    }
    return 0;
}

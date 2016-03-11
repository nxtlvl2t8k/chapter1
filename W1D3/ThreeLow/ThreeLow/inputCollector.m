//
//  inputCollector.m
//  ThreeLow
//
//  Created by Scott Mayhew on 2016-03-09.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "inputCollector.h"

@implementation inputCollector

-(NSString*)inputPrompt:(NSString *) promptString {
    NSLog(@"%@", promptString);
    
    char enteredValue[255];
    fgets(enteredValue, 255,stdin);
    
    //convert char array into string
    NSString *gotValue = [NSString stringWithUTF8String:enteredValue];
    NSString *gotMinusReturn = [[gotValue componentsSeparatedByString:@"\n"] firstObject];
    
    return gotMinusReturn;
}

@end

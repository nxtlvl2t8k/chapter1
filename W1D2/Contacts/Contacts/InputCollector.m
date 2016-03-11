//
//  InputCollector.m
//  Contacts
//
//  Created by Scott Mayhew on 2016-03-08.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector


-(NSString*)inputForPrompt:(NSString *) promptString {
    NSLog(@"%@", promptString);
    
    char enteredValue[255];
    
    fgets(enteredValue, 255, stdin);
    
 //convert char array into string
    NSString *inputedValue = [NSString stringWithUTF8String:enteredValue];
    NSString *inputMinusReturn = [[inputedValue componentsSeparatedByString:@"\n"] firstObject];
    
    return inputMinusReturn;
}

@end

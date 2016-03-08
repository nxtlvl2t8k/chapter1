//
//  main.m
//  Word Effects
//
//  Created by Scott Mayhew on 2016-03-07.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        bool userWantsToContinue = true;
        char play;
        
        while (userWantsToContinue) {
            
//            printf("Do you want to continue (y/n) ");
//            scanf("%c", &play);
//            
//            if (play == 'y') {
            
                //255 unit long array of characters
                char inputChars[255];
                
                printf("Input a string: ");
                //limit input to max 255 characters
                fgets(inputChars, 255, stdin);
                
//            //print as a c string
//            printf("Your string is %s \n", inputChars);
                
                //convert char array to an NSString object
                NSString *inputString = [NSString stringWithUTF8String:inputChars];
                NSString *inputStringWithoutReturn = [[inputString componentsSeparatedByString:@"\n"] firstObject];
                NSString *returnDash = [inputStringWithoutReturn stringByReplacingOccurrencesOfString:@" " withString:@"-"];
                
                // Print string to Uppercase
                NSString *upperCase = [inputString uppercaseString];
                
                // Print string to Lowercase
                NSString *lowerCase = [inputStringWithoutReturn lowercaseString];
            
                //Print a Number instead
                NSInteger *intValue;
            
                //print NSString object
                NSLog(@"Input was :%@", inputString);
                NSLog(@"Input was :%@", upperCase);
                NSLog(@"Input was :%@", lowerCase);
                NSLog(@"You entered the number %d this time", intValue);
                NSLog(@"Input was :%@, eh", inputStringWithoutReturn);
                
                if ([inputStringWithoutReturn hasSuffix:@"?"]) {
                    NSLog(@"I Dont Know");
                }else if ([inputStringWithoutReturn hasSuffix:@"!"]) {
                    NSLog(@"Whoa, Calm Down!");
                }
                NSLog(@"%@", returnDash);
                
//            }else {
//                return 0;
            
        }
        
    }
    return 0;
}

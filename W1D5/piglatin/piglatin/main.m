//
//  main.m
//  piglatin
//
//  Created by Scott Mayhew on 2016-03-11.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *startString = @"Hello Nikita";
        NSLog(@"start string: %@", startString);
        
        startString = [startString stringByPigLatinization];
        
        NSLog(@"modified string: %@", startString);
    }
    return 0;
}

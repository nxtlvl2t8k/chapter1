//
//  NSString+PigLatin.m
//  piglatin
//
//  Created by Scott Mayhew on 2016-03-11.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

- (NSString *)stringByPigLatinization {
    
    NSArray *words = [self componentsSeparatedByString:@" "];
    
    NSMutableArray *resultWords = [[NSMutableArray alloc] init];
    for (NSString *word in words) {
        NSString *modifiedWord = [word pigLatinWord];
        [resultWords addObject:modifiedWord];
    }
    
    NSString *resultString = [resultWords componentsJoinedByString:@" "];
    
    return resultString;
}

- (NSString *)pigLatinWord {
    
    return self;
}

@end

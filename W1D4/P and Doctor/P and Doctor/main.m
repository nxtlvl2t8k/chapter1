//
//  main.m
//  P & Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "Doctor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Patient *pat = [[Patient alloc] initWithName:@"" age:@"" hasHealthCard:YES];
        Doctor *doc  = [[Doctor alloc] initWithName:@"" field:@""];

        [pat visitDoctor:doc];
        [doc requestMedsFor:pat withSymptom: @"sneezing"];
        
        NSLog(@"%@", pat);
        
    }
        return 0;
}

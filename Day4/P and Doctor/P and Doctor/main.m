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
        
    }
        return 0;
}

//        NSArray *patients = [[NSArray alloc] init];
//
//        Patient *pat = [[Patient alloc] initWithName:@"" Age:@"" HasHealthCard:YES];
//        Doctor *doc = [[Doctor alloc] initWithName:@"" field:@""];
//
//        [pat visitDoctor:doc];
//        [pat requestMeds:doc];

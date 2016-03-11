//
//  Doctor.m
//  P & Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"

@implementation Doctor

- (instancetype)initWithName:(NSString*)name field:(NSString*)field
{
    self = [super init];
    if (self) {
        _name = name;
        _field = field;
    }
    return self;
}

- (void)acceptPatient:(Patient *)patient{
    if (hasheathCard) {
        Doctor.Patient = [[NSArray patients]addObject:@"Scott"];
    }else if {
        NSLog(@"Doesnt have Healthcard")
    }
    
}

- (void)giveMeds:(Patient *)patient{
    
}

@end

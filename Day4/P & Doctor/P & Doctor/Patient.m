//
//  Patient.m
//  P & Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "Patient.h"
#import "Doctor.h"

@implementation Patient

- (instancetype)initWithName:(NSString*)name Age:(NSString*)age HasHealthCard:(BOOL)healthcard
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _healthcard = healthcard;
    }
    return self;
}

- (void)visitDoctor:(Doctor *)doc {
    [doc acceptPatient:self];
}

- (void)requestMeds:(Doctor *)doc {
    [doc giveMeds:self];
}

@end

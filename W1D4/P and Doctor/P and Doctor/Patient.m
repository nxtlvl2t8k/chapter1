//
//  Patient.m
//  P & Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.


#import "Patient.h"
#import "Doctor.h"
#import "Perscription.h"


@implementation Patient

- (instancetype)initWithName:(NSString*)name age:(NSString*)age hasHealthCard:(BOOL)healthcard {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _healthcard = healthcard;
        _wittenPrescriptions = [[NSMutableArray alloc] init];
        _symptomList = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)visitDoctor:(Doctor *)doc {
    [doc patientVisit:self];
}


- (void)addPrescription:(Perscription*)prescription
{
    [self.wittenPrescriptions addObject:prescription];
}

//-(void)requestMeds:(Doctor *)doc {
//    [doc giveMeds:self];
//    
//}


//- (void)requestMeds:(Doctor *)doc {
//    [doc giveMeds:self];
//}
//





@end
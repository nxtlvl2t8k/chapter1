//
//  Doctor.m
//  P & Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"
#import "Perscription.h"

@implementation Doctor

- (instancetype)initWithName:(NSString*)name field:(NSString*)field
{
    self = [super init];
    if (self) {
        _name = name;
        _field = field;
        _patientDB = [[NSMutableSet alloc] init];

        
    }
    return self;
}

-(void)patientVisit:(Patient *)patient
{
    if (patient.healthcard) {
        NSLog(@"Accepted");
        [self.patientDB addObject:patient];
    }
}


-(void)requestMedsFor:(Patient *)patient withSymptom:(NSString*)symptom
{
    // check if patient is seen by this doctor
    if ([self.patientDB containsObject:patient]){
        
        // create prescriptin object
        Perscription *requestedPrescription = [[Perscription alloc] initForSymtom:symptom];
        
        
        // add prescription to patient's list of perscriptions written for them
        [patient addPrescription:requestedPrescription];
        
    }
    
    
    
}


//-(void)giveMeds:(Patient *)patient {
//    NSLog(@"asking");
//
//}



@end


//- (void)giveMeds:(Patient *)patient{
//
//}

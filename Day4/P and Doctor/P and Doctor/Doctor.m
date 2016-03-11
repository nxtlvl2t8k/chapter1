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
        _patientDB = [[NSMutableSet alloc] init];

        
    }
    return self;
}

-(void)patientVisit:(Patient *)patient {
    if (patient.healthcard) {
        NSLog(@"Accepted");
        [self.patientDB addObject:patient];
        
        
        
        
    }

}



@end


//- (void)giveMeds:(Patient *)patient{
//
//}

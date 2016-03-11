//
//  Doctor.h
//  P & Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Patient;

@interface Doctor : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* field;

-(void)patientVisit;

-(instancetype)initWithName:(NSString*)name field:(NSString*)field;
- (void)acceptPatient:(Patient *)patient;
- (void)giveMeds:(Patient *)patient;

@end

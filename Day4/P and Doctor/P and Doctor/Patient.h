//
//  Patient.h
//  P & Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Doctor;
@class Perscription;

@interface Patient : NSObject


@property (nonatomic) NSString* name;
@property (nonatomic) NSString* age;
@property (nonatomic) BOOL healthcard;
@property (nonatomic) NSMutableDictionary *symptomList;
@property (nonatomic) NSMutableArray *wittenPrescriptions;


- (instancetype)initWithName:(NSString*)name age:(NSString*)age hasHealthCard:(BOOL)healthcard;

- (void)visitDoctor:(Doctor *)doc;

//- (void)requestMeds:(Doctor *)doc;

- (void)addPrescription:(Perscription*)prescription;

@end


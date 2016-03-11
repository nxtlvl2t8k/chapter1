//
//  Patient.h
//  P & Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Doctor;

@interface Patient : NSObject

- (instancetype)initWithName:(NSString*)name age:(NSString*)age hasHealthCard:(BOOL)healthcard;

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* age;
@property (nonatomic) BOOL healthcard;

- (void)visitDoctor:(Doctor *)doc;

@end

//- (void)requestMeds:(Doctor *)doc;

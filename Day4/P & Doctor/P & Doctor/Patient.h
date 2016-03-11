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

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* age;
@property (nonatomic) BOOL healthcard;

- (instancetype)initWithName:(NSString*)name Age:(NSString*)age HasHealthCard:(BOOL)healthcard;
- (void)visitDoctor:(Doctor *)doc;
- (void)requestMeds:(Doctor *)doc;

@end

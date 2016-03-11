//
//  Perscription.m
//  P and Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "Perscription.h"

@implementation Perscription

- (instancetype)initForSymtom:(NSString*)symptom
{
    self = [super init];
    if (self) {
        _forSymptom = symptom;
    }
    return self;
}

- (instancetype)init
{
    
    return [self initForSymtom:@"unknown symptom"];
}

@end

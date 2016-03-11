//
//  Perscription.h
//  P and Doctor
//
//  Created by Scott Mayhew on 2016-03-10.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Perscription : NSObject

@property NSString* forSymptom;

- (instancetype)initForSymtom:(NSString*)symptom NS_DESIGNATED_INITIALIZER;

@end

//
//  Car.m
//  Car
//
//  Created by Scott Mayhew on 2016-01-31.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "Car.h"

@implementation Car {
    
}

@synthesize model = _model;

-(void) drive {
    
        NSLog(@"You are driving a %@", self.model);
        
}


@end

//
//  main.m
//  Car
//
//  Created by Scott Mayhew on 2016-01-29.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        Car *toyota = [[Car alloc] init];
        [toyota setModel: @"Toyota Prius"];
        NSLog(@"Created a %@", [toyota model]);
        
        Car *nissan = [[Car alloc] init];
        [nissan setModel:@"Nissan Rogue"];
        NSLog(@"Changed the car to a %@", [nissan model]);
        
        [toyota drive];
    }
    return 0;
    
}


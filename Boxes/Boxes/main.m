//
//  main.m
//  Boxes
//
//  Created by Scott Mayhew on 2016-03-09.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Box *box1 = [[Box alloc] initWithWidth:10 height:12 length:10];
        Box *box2 = [[Box alloc] initWithWidth:18 height:8 length:18];
        
        NSLog(@"Volume of Box A is %0.1f", box1.volume);
        NSLog(@"Volume of Box B is %0.1f", box2.volume);
        
        if ([box1 biggerThan:box2]) {
            NSLog(@"Box A is bigger by %@ times", box1);
            
        }else
            NSLog(@"Box B is Bigger by %@ times", box2);
        
    
    }
    return 0;
}

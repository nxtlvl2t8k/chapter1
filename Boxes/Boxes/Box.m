//
//  Box.m
//  Boxes
//
//  Created by Scott Mayhew on 2016-03-08.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "Box.h"

@implementation Box

- (instancetype)initWithWidth:(float)width height:(float) height length:(float) length
{
    self = [super init];
    if (self) {
        
        self.width = width;
        self.height = height;
        self.length = length;
        
    }
    return self;
}


-(float) volume {
    return self.width * self.length * self.height;
}

-(float) biggerThen:(Box *)otherBox {
    if ([self volume] > [otherBox volume]) {
        return ([self volume] / [otherBox volume]);
        
    }else {
        
    
        return ([otherBox volume] / [self volume]);
    }
}


@end

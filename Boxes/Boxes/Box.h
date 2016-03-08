//
//  Box.h
//  Boxes
//
//  Created by Scott Mayhew on 2016-03-08.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Box : NSObject


@property (nonatomic, assign) float width;
@property (nonatomic, assign) float length;
@property (nonatomic, assign) float height;


-(float)volume;
-(float)biggerThen:(Box*)otherBox;

- (instancetype)initWithWidth:(float)width height:(float) height length:(float) length;


@end

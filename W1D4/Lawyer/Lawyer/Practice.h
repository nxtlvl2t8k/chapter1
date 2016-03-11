//
//  Practice.h
//  Lawyer
//
//  Created by Scott Mayhew on 2016-03-11.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

enum specialtyType
{
    FamilyLaw = 1,
    PatentLaw = 2,
    CriminalLaw = 3,
    CorporateLaw = 4
};

@interface Practice : NSObject

- (instancetype)initWithLawyer:(NSArray *)Lawyer practice:(NSArray *)practice rate:(float)rate;

//Law must be 1 of 4 practices
enum specialtyType Lawtype;

//set lawtype to 1 of the 4
-(void)setTypeofPractice:(enum specialtyType)x;


@end

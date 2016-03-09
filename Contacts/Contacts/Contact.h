//
//  Contact.h
//  Contacts
//
//  Created by Scott Mayhew on 2016-03-08.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;

-(NSString *) name;
-(NSString *) email;

@end

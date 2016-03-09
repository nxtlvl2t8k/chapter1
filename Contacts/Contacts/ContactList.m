//
//  ContactList.m
//  Contacts
//
//  Created by Scott Mayhew on 2016-03-08.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contactList = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)addContact:(Contact *) newContact
{
    [self.contactList addObject:newContact];
}


@end

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

-(void)displayList{
    
    for (int i=0; i<self.contactList.count; i++) {
        Contact * contact = self.contactList[i];
        NSLog(@"%d: %@ %@", i, contact.name, contact.email);
    }
    
    
//    for (Contact *contact in self.contactList) {
//        NSLog(@"%lu: %@ %@", (unsigned long)[self.contactList indexOfObject:contact], contact.name, contact.email);
//    }
}



@end

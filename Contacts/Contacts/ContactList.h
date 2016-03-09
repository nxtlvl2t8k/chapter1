//
//  ContactList.h
//  Contacts
//
//  Created by Scott Mayhew on 2016-03-08.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property (nonatomic, strong) NSMutableArray *contactList;


-(void)addContact:(Contact *) newContact;







@end

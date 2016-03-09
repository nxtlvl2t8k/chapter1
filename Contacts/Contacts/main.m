//
//  main.m
//  Contacts
//
//  Created by Scott Mayhew on 2016-03-09.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        char createNew[255];
        
        while (true) {
            NSLog(@"What would you like do next? new - Create a new contact list - List all contacts quit - Exit Application > %s", createNew);
            fgets(createNew, 255, stdin);
            NSString *getMenuItem = [NSString stringWithUTF8String:createNew];
            NSString *itemMinusReturn = [[getMenuItem componentsSeparatedByString:@"\n"] firstObject];
            if ([itemMinusReturn isEqualToString: @"new"]) {

                NSLog(@"Enter your Name and Email %@", newContact);
                
                InputCollector *newUserInfo = [[InputCollector alloc] inputForPrompt:newContact];
                
                Contact *newContact = [[Contact alloc] name];

                ContactList *newEntry = [[ContactList alloc] addContact:newContact];
                
                
                
                
                
            }else if ([itemMinusReturn isEqualToString: @"quit"]) {
                return 0;
            }
            
            
            
            
        }
    }
    return 0;
}

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

        
        while (true) {

            InputCollector *menuPick = [[InputCollector alloc] init];
            
            
            NSString *createNew = @"What would you like do next? new - Create a new contact list - List all contacts quit - Exit Application >";
            NSString *input = [menuPick inputForPrompt:createNew];
            
            //            // put in inputcollector to make code better
            //            NSString *getMenuItem = [NSString stringWithUTF8String:menuPick];
            //            NSString *itemMinusReturn = [[getMenuItem componentsSeparatedByString:@"\n"] firstObject];
            if ([input isEqualToString: @"new"]) {
              
                NSString *inputContactName = @"What is your Name";
                NSString *newContactName = [menuPick inputForPrompt:inputContactName];
                NSString *inputContactEmail = @"What is your Email";
                NSString *newContactEmail = [menuPick inputForPrompt:inputContactEmail];
                
                ContactList *newEntry = [[ContactList alloc] addContact:newContactName];
                NSLog(@"%@ %@", newEntry.name, newEntry.email);
                NSLog(@"Inside new!");
                
                //                NSLog(@"Enter your Name and Email %@", newContact);
                //                Contact *newContact = [[Contact alloc] name];
                //
                //
                //
                //                ContactList *newEntry = [[ContactList alloc] addContact:newContact];
                //
                //
                //                
                //                
                //                
            }else if ([input isEqualToString: @"quit"]) {
                return 0;
            }
        }
    }
    return 0;
}

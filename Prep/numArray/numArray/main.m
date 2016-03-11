//
//  main.m
//  numArray
//
//  Created by Scott Mayhew on 2016-02-16.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int i = 0;
int num = 0;

int main(int argc, char * argv[]) {
    @autoreleasepool {

//        NSArray * num_array = @[@1,@4,@2,@200,@5,@4];
//        NSLog(@"%@", (num_array));

        NSMutableArray *randomNumbers = [NSMutableArray array];

        //For loop to execute 5 times
        for (i=0; i<5; i++){
            //Create random number between 1-45 and save it in Array
            num = arc4random_uniform(45) + 1;
            [randomNumbers addObject:[NSNumber numberWithInt:num]];
            NSLog(@"Number at index %d is %d",i, num);
        
        }
        NSLog(@"MyArray:\n%@", randomNumbers);
        
        NSNumber *largest = [randomNumbers objectAtIndex:0];
        
        for (NSNumber * curr_num in randomNumbers) {
            if (curr_num.intValue > largest.intValue) {
                largest = curr_num;
            }
        }
        NSLog(@"Largest Number in array is %@" , largest);
    }
    return 0;
}


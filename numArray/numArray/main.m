//
//  main.m
//  numArray
//
//  Created by Scott Mayhew on 2016-02-16.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int(i) = 0;
int(j) = 0;
NSNumber *tempLargest;
NSNumber *largestNumber;

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));

        -(void)makeRandomNumbers (*randomNumber:NSNumber) {
            
            //For loop to execute 5 times
            for (i=0;i>5;i++){
                //Create random number between 1-45 and save it in Array
                randomNumber = arc4random(45) + 1;
                NSLog(@"Numbers are %@", randomNumber);
            }
        }
        
        //Find largest number in Array
        -(void)locateLargest() {
            tempLargest = makeRandomNumbers(0)
            for j in 0...makeRandomNumbers() {
                if makeRandomNumbers(j) > makeRandomNumbers(j + 1){
                    tempLargest = makeRandomNumbers(j)
                    j ++
                }else {
                    tempLargest = makeRandomNumbers(j + 1)
                    j ++
                }
            }
        }
        
    }
    

    NSLog(@"Loading group of numbers");
    makeRandomNumbers();
    locateLargest();
    largestNumber = tempLargest;
    NSLog(@"The largest number in the group is - %@", largestNumber);
}


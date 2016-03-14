//
//  main.m
//  binary search
//
//  Created by Scott Mayhew on 2016-03-08.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int i = 0;
int num = 0;
int findElem(NSMutableArray *array, int st, int end, int elem);


int main(int argc, char * argv[]) {
    @autoreleasepool {
        
//              int num [] = {1,4,2,200,5,4};
//        int size = sizeof(num) / sizeof(int);
//        int index = findElem(size, 0, size - 1, 15);
//        NSLog(@"%i", index);
        
        NSMutableArray *randomNumbers = [NSMutableArray array];
        //For loop to execute 5 times
        for (i=0; i<1000000; i++){
            //Create random number between 1-45 and save it in Array
            num = i + 1; //arc4random_uniform(45) + 1;
            [randomNumbers addObject:[NSNumber numberWithInt:num]];
        

            
        }
                NSNumber *largest = [randomNumbers objectAtIndex:0];
        
                for (NSNumber * curr_num in randomNumbers) {
                    if (curr_num.intValue > largest.intValue) {
                        largest = curr_num;
                    }
                }
//                NSLog(@"Largest Number in array is %@" , largest);
//        NSLog(@"MyArray:\n%@", randomNumbers);

        NSDate *methodStart = [NSDate date];
        
        //search for target in massive array
        int index = findElem(randomNumbers, 0, num-1, 100);
        NSLog(@"Number at index %i is %d", i, index);
        
        
        
        
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %f", executionTime);
   
    
    
    
    }
    return 0;
}

int findElem(NSMutableArray *array, int st, int end, int elem)
{
    int mid = st + (end - st) / 2;
    if (st > end) {
        return -1;
    }else if ([[array objectAtIndex:mid] integerValue] == elem) {
        NSLog(@"%d", mid);
        return mid;
    }else if ([[array objectAtIndex:mid] integerValue] > elem) {
        int index = findElem(array, st, mid-1, elem);
        //        center = (center - st) / 2;
        return index;
    }else if ([[array objectAtIndex:mid] integerValue] < elem){
        int index = findElem(array, mid+1, end, elem);
        //        center = (center + en) / 2;
        return index;
    }
    return -1;
}

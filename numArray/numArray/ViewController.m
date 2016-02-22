//
//  ViewController.m
//  numArray
//
//  Created by Scott Mayhew on 2016-02-16.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

var i = 0;

@end

@implementation ViewController

-(void)makeRandomNumbers (NSInteger *) randomNumber() {

    //For loop to execute 5 times
    for (i=0;i>5;i++){
        //Create random number between 1-45 and save it in Array
        _numList = arc4random(45) + 1;
        NSLog(@"Numbers are %@", _numList);
    }
}

//Find largest number in Array
-(void)locateLargest {
    switch tempLargest;
    case 1:
        if numList[0] >= numList[1] || numList[0] >= numList[2] || numList[0] >= numList[3] || numList[0] >= numList[4] || numList[0] >= numList[5] {
            tempLargest = numList[0];
            break;
        }
    case 2:
        if numList[1] >= numList[2] || numList[1] >= numList[3] || numList[1] >= numList[4] || numList[1] >= numList[5] {
            tempLargest = numList[1];
            break;
        }
    case 3:
        if numList[2] >= numList[3] || numList[2] >= numList[4] || numList[2] >= numList[5] {
            tempLargest = numList[2];
            break;
        }
    case 4:
        if numList[3] >= numList[4] || numList[3] >= numList[5] {
            tempLargest = numList[3];
            break;
        }
    
    default:
    tempLargest = numList[4];
    break;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Loading group of numbers");
    makeRandomNumbers();
    locateLargest();
    largestNum = tempLargest;
    NSLog(@"The largest number in the group is - %@", largestNum);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

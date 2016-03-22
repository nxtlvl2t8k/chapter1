//
//  ViewController.m
//  PlayerMath
//
//  Created by Scott Mayhew on 2016-03-14.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *inputLbl;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numbBtn;
@property (weak, nonatomic) IBOutlet UIButton *enterBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.inputLbl.text = @"";
    self.gameModel = [[GameModel alloc]init];
//    [self showQuestionButton:nil];
    self.player1Score.text = [NSString stringWithFormat:@"%d", self.gameModel.player1.score];
    self.player2Score.text = [NSString stringWithFormat:@"%d", self.gameModel.player2.score];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)anyButtonPressed:(UIButton *)sender {

    NSMutableArray *labelNumbers = [[NSMutableArray alloc] init];
    
    self.inputLbl.text = [self.inputLbl.text stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)sender.tag]];
    [labelNumbers addObject: [NSString stringWithFormat:@"%ld", (long)sender.tag]];
    NSLog(@"%@", labelNumbers);

}
- (IBAction)enterPressedBtn:(id)sender {
    
    [self.gameModel checkAnswer:self.inputLbl.text.intValue];
    self.inputLbl.text = @"";
    
    //update score labels
    self.player1Score.text = [NSString stringWithFormat:@"%d", self.gameModel.player1.score];
    self.player2Score.text = [NSString stringWithFormat:@"%d", self.gameModel.player2.score];
    self.questionBarLbl.text = [self.gameModel generateQuestion];

}
//- (IBAction)showQuestionButton:(UIButton *)sender {
//    // ask gameModel to generate a question
//    
//    self.questionBarLbl.text = [self.gameModel generateQuestion];
//    
//    // read numbers from model, and put them in the view.
//    
//}
//

@end

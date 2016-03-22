//
//  ViewController.h
//  PlayerMath
//
//  Created by Scott Mayhew on 2016-03-14.
//  Copyright © 2016 Huge Holdings Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;
@property (weak, nonatomic) IBOutlet UILabel *questionBarLbl;

@property (nonatomic,strong)GameModel *gameModel;

- (IBAction)anyButtonPressed:(UIButton *)sender;
- (IBAction)enterPressedBtn:(id)sender;


@end


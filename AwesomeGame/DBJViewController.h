//
//  DBJViewController.h
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBJHero.h"
#import "DBJBoss.h"

@interface DBJViewController : UIViewController

@property NSArray *tileArray;
@property DBJHero *hero;
@property DBJBoss *boss;
@property int heroXCoordinate;
@property int heroYCoordinate;

- (IBAction)startNewGame:(UIButton *)sender;
- (IBAction)performTileAction:(UIButton *)sender;
- (IBAction)pressUpButton:(UIButton *)sender;
- (IBAction)pressDownButton:(UIButton *)sender;
- (IBAction)pressLeftButton:(UIButton *)sender;
- (IBAction)pressRightButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *actionButtonTitle;
@property (weak, nonatomic) IBOutlet UILabel *heroStatsLabel;
@property (weak, nonatomic) IBOutlet UILabel *storyTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigBackgroundImage;

@property (weak, nonatomic) IBOutlet UIButton *upArrow;
@property (weak, nonatomic) IBOutlet UIButton *leftArrow;
@property (weak, nonatomic) IBOutlet UIButton *rightArrow;
@property (weak, nonatomic) IBOutlet UIButton *downArrow;
@end

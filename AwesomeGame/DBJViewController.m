//
//  DBJViewController.m
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import "DBJViewController.h"
#import "DBJTile.h"
#import "DBJTileFactory.h"
#import "DBJHero.h"
#import "DBJTile.h"
//#include <stdlib.h>


@interface DBJViewController ()

@end

@implementation DBJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSLog(@"about to call factory method");

    //being game restart
//    self.tileArray = [DBJTileFactory generateNewTileSetForGame];
//    self.heroXCoordinate = 0;
//    self.heroYCoordinate = 0;
//    self.hero = [[DBJHero alloc] initWithSetStats];
//    self.boss = [[DBJBoss alloc] init];
    [self startNewGame:nil];
    
    //NSLog(@"tilefactory call copmlete, about to updateGameView");

    //NSLog(@"updateGameView call complete");
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)updateGameState
{
    if(self.hero.health <= 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Game Over!" message:@"Your valiant struggles end in defeat this time, restart your journey and slay the beast?" delegate:nil cancelButtonTitle:@"Restart" otherButtonTitles:nil, nil];
        [alert show];
        [self startNewGame:nil];
    }
    else if(self.boss.health <= 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Victory!" message:@"A wave of jubilation sweeps across the kingdom, the boss is dead and you may return home to your castle" delegate:nil cancelButtonTitle:@"Play again?" otherButtonTitles:nil, nil];
        [alert show];
        [self startNewGame:nil];
        
    }
    
    //NSLog(@"Now at location (%u,%u)",self.heroXCoordinate,self.heroYCoordinate);
}

- (void)updateGameView
{
    DBJTile *currentTile = self.tileArray[self.heroYCoordinate][self.heroXCoordinate];
    
    self.bigBackgroundImage.image = currentTile.bigBackground;
    self.storyTextLabel.text = currentTile.storyText;
    NSString *statText = [NSString stringWithFormat:@"Damage: %d\nHealth: %d\nWeapon: %@\nWeapon Bonus: %d\nArmor: %@\nArmor Bonus:%d",self.hero.damage,self.hero.health,self.hero.weapon.name,
        self.hero.weapon.attackBonus,self.hero.armor.name,
        self.hero.armor.defenseBonus];
    self.heroStatsLabel.text = statText;
    
    
    //self.actionButtonTitle.titleLabel.text = currentTile.actionText;
    [self.actionButtonTitle setTitle:currentTile.actionText forState:UIControlStateDisabled];
    [self.actionButtonTitle setTitle:currentTile.actionText forState:UIControlStateNormal];
    
    if(currentTile.canMove){
        self.leftArrow.enabled = TRUE;
        self.rightArrow.enabled = TRUE;
        self.upArrow.enabled = TRUE;
        self.downArrow.enabled = TRUE;
    }else{
        self.leftArrow.enabled = FALSE;
        self.rightArrow.enabled = FALSE;
        self.upArrow.enabled = FALSE;
        self.downArrow.enabled = FALSE;
    }
    
    if(currentTile.canPerformAction)
        self.actionButtonTitle.enabled = TRUE;
    else
        self.actionButtonTitle.enabled = FALSE;
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)startNewGame:(id)sender {
    self.tileArray = [DBJTileFactory generateNewTileSetForGame];
    self.heroXCoordinate = 0;
    self.heroYCoordinate = 0;
    self.hero = [[DBJHero alloc] initWithSetStats];
    self.boss = [[DBJBoss alloc] init];
    
    [self updateGameState];
    [self updateGameView];

}

- (IBAction)performTileAction:(id)sender {
    
    DBJTile *currentTile = self.tileArray[self.heroYCoordinate][self.heroXCoordinate];
    
    int monsterDamage;
    int villageHeal;
    int damageTaken;
    int bossDamage;
    int heroDamage;
    int heroDamageTaken;
    int bossDamageTaken;
    TileType newTileType = arc4random() % tileTypeCount;
    DBJTile *randomTile = [[DBJTile alloc]initWithTileType:newTileType];
    
    switch (currentTile.type)
    {
        case monster:
            monsterDamage = (arc4random() % 5) + 2;
            damageTaken = [self.hero takeDamage:monsterDamage];
            currentTile.storyText = [NSString stringWithFormat:@"The creatures attacks with a force of %u, but he now lays dead", damageTaken];
            currentTile.actionText = @"The beast lays dead!";
            currentTile.canPerformAction = FALSE;
            currentTile.canMove = TRUE;
            break;
        case mystery:
            currentTile.type = randomTile.type;
            currentTile.bigBackground = randomTile.bigBackground;
            currentTile.storyText = randomTile.storyText;
            currentTile.actionText = randomTile.actionText;
            currentTile.canPerformAction = randomTile.canPerformAction;
            currentTile.canMove = randomTile.canMove;
            break;
        case village:
            villageHeal = (arc4random() % 1) + 2;
            self.hero.health += villageHeal;
            currentTile.storyText = [NSString stringWithFormat:@"The villagers bring food and ale, gain %u health", villageHeal];
            currentTile.actionText = @"Thanks, friends!";
            currentTile.canPerformAction = FALSE;
            break;
        case cave:
            monsterDamage = (arc4random() % 3) + 1;
            damageTaken = [self.hero takeDamage:monsterDamage];
            self.hero.weapon.attackBonus+=2;
            self.hero.weapon.name = @"Stronger Cave Sword";
            self.hero.armor.defenseBonus+=2;
            self.hero.armor.name = @"Stronger Cave Armor";
            currentTile.storyText = [NSString stringWithFormat:@"The descent is difficult, facing %u damage, but the spoils are great!", damageTaken];
            currentTile.actionText = @"Empty Cave";
            currentTile.canPerformAction = FALSE;
            break;
        case boss:
            bossDamage = self.boss.giveDamage;
            damageTaken = [self.hero takeDamage:bossDamage];
            heroDamage = self.hero.damage + self.hero.weapon.attackBonus;
            bossDamageTaken = [self.boss takeDamage:heroDamage];
            currentTile.storyText = [NSString stringWithFormat:@"A mighty struggle ensues!  You inflict %d damage, but take %d in return!\nBoss Health: %d", bossDamageTaken,heroDamageTaken,self.boss.health];
            NSLog(@"%d",bossDamage);
            NSLog(@"%d",damageTaken);
            NSLog(@"%d",heroDamage);
            NSLog(@"%d",bossDamageTaken);
            break;
        default:
            break;
    }
    [self updateGameState];
    [self updateGameView];

}



- (IBAction)pressUpButton:(UIButton *)sender {
    if(self.heroYCoordinate==3){
        self.storyTextLabel.text = @"You begin to head north before deciding to turn around.  There is still work to do here";
    }else{
        self.heroYCoordinate++;
        [self updateGameState];
        [self updateGameView];
    }
}


- (IBAction)pressDownButton:(UIButton *)sender {
    if(self.heroYCoordinate==0){
        self.storyTextLabel.text = @"You begin to head south before deciding to turn around.  There is still work to do here";
    }else{
        self.heroYCoordinate--;
        [self updateGameState];
        [self updateGameView];
    }
}

- (IBAction)pressLeftButton:(UIButton *)sender {
    if(self.heroXCoordinate==0){
        self.storyTextLabel.text = @"You begin to head west before deciding to turn around.  There is still work to do here";
    }else{
        self.heroXCoordinate--;
        [self updateGameState];
        [self updateGameView];
    }
}


- (IBAction)pressRightButton:(UIButton *)sender {
    if(self.heroXCoordinate==2){
        self.storyTextLabel.text = @"You begin to head east before deciding to turn around.  There is still work to do here";
    }else{
        self.heroXCoordinate++;
        [self updateGameState];
        [self updateGameView];
    }
}
@end

//
//  DBJTile.m
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import "DBJTile.h"

@implementation DBJTile

// Car.m
- (id)initWithTileType:(TileType)type {
    self = [super init];
    if (self) {
        // Any custom setup work goes here
        self.type = type;
        
        
        //fill out tiles
        switch (type)
        {
            case empty:
                self.bigBackground = nil;
                self.storyText = @"There is nothing for you to do here.  It is time to move on with your mission";
                self.actionText = @"No action to perform";
                self.canPerformAction = FALSE;
                self.canMove = TRUE;
                break;
            case monster:
                self.bigBackground = [UIImage imageNamed:@"monster.jpeg"];
                self.storyText = @"Ambushed!  You steady yourself and draw your blade, it is time for blood.";
                self.actionText = @"Attack the beast!";
                self.canPerformAction = TRUE;
                self.canMove = FALSE;
                break;
            case mystery:
                self.bigBackground = [UIImage imageNamed:@"mystery.jpeg"];
                self.storyText = @"Fortune favors the bold, but the bold are close cousins to the dead...";
                self.actionText = @"Tempt Fate?";
                self.canPerformAction = TRUE;
                self.canMove = TRUE;
                break;
            case village:
                self.bigBackground = [UIImage imageNamed:@"village.jpeg"];
                self.storyText = @"village";
                self.actionText = @"Wander in for drink/rest";
                self.canPerformAction = TRUE;
                self.canMove = TRUE;
                break;
            case cave:
                self.bigBackground = [UIImage imageNamed:@"cave.jpeg"];
                self.storyText = @"You come to the entrance of a cave.  The legend of a king's treasure buried within the depths comes to mind.";
                self.actionText = @"Venture into the unknown";
                self.canPerformAction = TRUE;
                self.canMove = TRUE;
                break;
            case boss:
                self.bigBackground = [UIImage imageNamed:@"boss.jpeg"];
                self.storyText = @"Your mortal enemy beckons you closer...";
                self.actionText = @"End this now!!!";
                self.canPerformAction = TRUE;
                self.canMove = FALSE;
                break;
            default:
                break;
        }
    }
    return self;
}

- (id)init {
    // Forward to the "designated" initialization method
    return [self initWithTileType: empty];
}

@end

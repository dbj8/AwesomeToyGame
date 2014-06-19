//
//  DBJArmor.m
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import "DBJArmor.h"

@implementation DBJArmor

-(id) initWithName:(NSString *)name withDefenseBonus:(int)defenseBonus
{
    self = [super init];
    
    if(self)
    {
        self.name = name;
        self.defenseBonus = defenseBonus;
    }
    return self;
}

@end

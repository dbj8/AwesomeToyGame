//
//  DBJWeapon.m
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import "DBJWeapon.h"

@implementation DBJWeapon

-(id) initWithName:(NSString *)name withDamageBonus:(int)damageBonus
{
    self = [super init];
    
    if(self)
    {
        self.name = name;
        self.attackBonus = damageBonus;
    }
    return self;
}

@end

//
//  DBJBoss.m
//  AwesomeGame
//
//  Created by David Jordan on 6/19/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import "DBJBoss.h"

@implementation DBJBoss

- (id)init{
    self = [super init];
    if(self)
    {
        self.health = 20;
    }
    return self;
}

- (int) giveDamage
{
    int damage = (arc4random() % 2) + 3;
    return damage;
}

- (int) takeDamage:(int)damage
{
    int defense = (arc4random() % 2) + 1;
    int damageTaken = MAX(0,damage - defense);
    self.health -= damageTaken;
    return damageTaken;
}


@end

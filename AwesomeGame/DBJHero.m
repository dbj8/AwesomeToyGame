//
//  DBJHero.m
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import "DBJHero.h"

@implementation DBJHero

- (id)initWithSetStats
{
    self = [super init];
    if(self)
    {
        self.damage = 2;
        self.health = 25;
        self.weapon = [[DBJWeapon alloc] initWithName:@"Weak Sword"
                                      withDamageBonus:1];
        self.armor = [[DBJArmor alloc] initWithName:@"Weak Armor"
                                   withDefenseBonus:1];
    }

    return self;
}

- (int) takeDamage:(int)damage
{
    int actualDamage = MAX(damage - self.armor.defenseBonus, 0);
    self.health -= actualDamage;
    return actualDamage;
}

@end

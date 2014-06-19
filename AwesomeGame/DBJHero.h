//
//  DBJHero.h
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBJWeapon.h"
#import "DBJArmor.h"

@interface DBJHero : NSObject

@property int damage;
@property int health;
@property DBJWeapon *weapon;
@property DBJArmor *armor;

- (id)initWithSetStats;
- (int) takeDamage:(int)damage;

@end

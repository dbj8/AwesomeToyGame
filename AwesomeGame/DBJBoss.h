//
//  DBJBoss.h
//  AwesomeGame
//
//  Created by David Jordan on 6/19/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBJBoss : NSObject

@property int health;

- (int) giveDamage;
- (int) takeDamage:(int)damage;

@end

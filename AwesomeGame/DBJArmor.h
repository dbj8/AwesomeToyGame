//
//  DBJArmor.h
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBJArmor : NSObject

@property NSString *name;
@property int defenseBonus;

-(id) initWithName:(NSString *)name withDefenseBonus:(int)defenseBonus;

@end
